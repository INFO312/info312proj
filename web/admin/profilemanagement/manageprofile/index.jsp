<%-- 
    Document   : index
    Created on : 14/09/2015, 10:37:14 AM
    Author     : Nathan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="domain.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = "";
    String sidebarURL = "";

    // Check if the user is logged in. If no then redirect to login.jsp
//    Person p = (Person) session.getAttribute("currentuser");
//    String userType = (String) session.getAttribute("usertype");
    String r = "admin";
    Person p = new Person("Mr", r, "User", r, r, r, r, r, r, 'M', "1/1/11");
    String userType = "r";

    if (userType != "r") {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    name = p.getFirstname() + " " + p.getLname();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/WEB-INF/jspf/global-include.jspf" />
        <link href="/PostGradSystem/css/admin/form.css" rel="stylesheet" type="text/css" />
        <link href="/PostGradSystem/css/admin/manageForm.css" rel="stylesheet" type="text/css" />
        <title><%=name%></title>
    </head>
    
    <body>
        
        <div id ="container">
            <jsp:include page="/WEB-INF/jspf/global/header.jspf" flush="true">
                <jsp:param name="name" value="<%= name%>" />
            </jsp:include>
            <jsp:include page="/WEB-INF/jspf/sidebar/admin.jspf" flush="true" />  

            <div id="main_content_area">
                <nav id="subnav">
                    <h2>Manage profiles</h2>
                </nav>
                    
                    <form action="">
                    <input type="radio" name="departmentmember" value="heathercooper">Heather Cooper<br>
                    <input type="radio" name="departmentmember" value="michaelwinikoff">Michael Winikoff
                    </form>
                    
                    
                    
                    
                    
                    
                </div>

            <%@include file = "/WEB-INF/jspf/global/footer.jspf" %>
        </div>
    </body>
</html>
