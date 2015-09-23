<%-- 
    Document   : index
    Created on : Sep 11, 2015, 11:45:13 AM
    Author     : csutton
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = "";
    String sidebarURL = "";

    String userType = (String)session.getAttribute("userType");
    userType = "r";
    if (userType != "r") {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    Person p = (Person)session.getAttribute("currentUser");
    if(p != null) name = p.getFirstname() + " " + p.getLname();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <jsp:include page="/WEB-INF/jspf/global-include.jspf" />
        <link href="/PostGradSystem/css/root/manageDepartment.css" rel="stylesheet" type="text/css" />
        <title><%=name%></title>
        <script src="/PostGradSystem/scripts/root/addAnotherQualification.js" type="text/javascript"></script>
        <script src="/PostGradSystem/scripts/root/showHide.js" type="text/javascript"></script>
        <script src="/PostGradSystem/scripts/datePicker.js" type="text/javascript"></script>
    </head>
    <body>
        <div id ="container">
            <jsp:include page="/WEB-INF/jspf/global/header.jspf" flush="true">
                <jsp:param name="name" value="<%= name%>" />
            </jsp:include>
            <jsp:include page="/WEB-INF/jspf/sidebar/root.jspf" flush="true" />  
            <div id="main_content_area">
                <nav class="subnav">
                    <h2>Manage Department Members</h2>
                    <ul>
                        <li class="subnav-item selected">Create</li>
                        <li class="subnav-item">Manage</li>
                    </ul>
                </nav>

                <jsp:include page="/WEB-INF/jspf/root/createDepartmentMemberForm.jspf" flush="true" /> 
                <jsp:include page="/WEB-INF/jspf/root/manageDepartmentMembers.jspf" flush="true" /> 
                
            </div>
            <%@include file = "/WEB-INF/jspf/global/footer.jspf" %>
        </div>
    </body>
</html>
