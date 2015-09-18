<%-- 
    Document   : index
    Created on : Sep 11, 2015, 11:45:13 AM
    Author     : csutton
--%>
<%@page import="resources.Util"%>
<%@page import="domain.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Person p = new Person( "Mr", "Root",  "User", "Root", "Root", "Root", "Root",
        "Root", "Root", 'M' ,Util.convertStringToTimestamp("1900-12-01 00:00:00") );
    String userType = "a";
    
    if (userType != "a") {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    String name = p.getFirstname() + " " + p.getLname();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <jsp:include page="/WEB-INF/jspf/global-include.jspf" />
        <link href="/PostGradSystem/css/admin/portalManagement.css" rel="stylesheet" type="text/css" />
        <title><%=name%></title>
    </head>
    <body>
        <div id ="container">
            <jsp:include page="/WEB-INF/jspf/global/header.jspf" flush="true">
                <jsp:param name="name" value="<%= name%>" />
            </jsp:include>
            <jsp:include page="/WEB-INF/jspf/sidebar/admin.jspf" flush="true" />

            <div id="main_content_area">
                
                <nav class="subnav">
                    <h2>Portal Management</h2>
                </nav>
                
                <div class="tooltip">
                   <p>This pages allows for the management of the student portal. The current functionality allows for</p>
                    <ul>
                        <li>Creating new programs</li>
                        <li>Managing current programs through editing and deleting functionality</li>
                    </ul>
                   <p>If you require the addition of a department member or the modification of a department members access level you must log in with root access.</p>
                </div>

                <%@include file = "/WEB-INF/jspf/admin/managePrograms.jspf" %>
                <%@include file = "/WEB-INF/jspf/admin/createProgram.jspf" %>
                
            </div>
            <%@include file = "/WEB-INF/jspf/global/footer.jspf" %>
        </div>
    </body>
</html>
