<%-- 
    Document   : index
    Created on : Sep 11, 2015, 11:45:13 AM
    Author     : csutton
--%>
<%@page import="resources.Util"%>
<%@page import="domain.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Person p = new Person("Mr", "Root", "User", "Root", "Root", "Root", "Root",
            "Root", "Root", 'M', Util.convertStringToTimestamp("1900-12-01 00:00:00"));
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
        <link href="/PostGradSystem/css/applicationSummaryTable.css" rel="stylesheet" type="text/css" />
        <link href="/PostGradSystem/css/admin/applicationManagement.css" rel="stylesheet" type="text/css" />
        <title><%=name%></title>
    </head>
    <body>
        <div id ="container">
            <jsp:include page="/WEB-INF/jspf/global/header.jspf" flush="true">
                <jsp:param name="name" value="<%= name%>" />
            </jsp:include>
            <jsp:include page="/WEB-INF/jspf/sidebar/admin.jspf" flush="true" />

            <div id="main_content_area">

                <div class="subnav">
                    <h2>Application Management</h2>
                    <ul>
                        <li class="subnav-item"><a href="/PostGradSystem/admin/applicationManagement/index.jsp">Attention Required</a></li>
                        <li class="subnav-item"><a href="/PostGradSystem/admin/applicationManagement/newApplications.jsp">New Applications</a></li>
                        <li class="subnav-item"><a href="/PostGradSystem/admin/applicationManagement/currentApplications.jsp">Current Applications</a></li>
                        <li class="subnav-item"><a href="/PostGradSystem/admin/applicationManagement/applicationsHistory.jsp">Applications History</a></li>
                        <li class="subnav-item active"><a href="/PostGradSystem/admin/applicationManagement/search.jsp">Search</a></li>
                    </ul>
                </div>
                
                <div id="applicationSearchWrapper">
                    
                    <form>
                        <label for="searchbox">Search Applications</label>
                        <br>
                        <input type="text" name="searchbox">
                        <input type="submit" value="Search">
                    </form>
                    
                </div>
                
                <div id="searchOutput">
                    <hr>
                    <h3>Results</h3>
                    <hr>
                    <jsp:include page="/WEB-INF/jspf/admin/applicationSummaryTableWithTitle.jspf" flush="true">
                        <jsp:param name="name" value="John Smith" />
                        <jsp:param name="qualification" value="Master of Business Data Science" />
                    </jsp:include>

                    <jsp:include page="/WEB-INF/jspf/admin/applicationSummaryTableWithTitle.jspf" flush="true">
                        <jsp:param name="name" value="Bob Lee" />
                        <jsp:param name="qualification" value="Master of Science" />
                    </jsp:include>

                </div>

            </div>
            <%@include file = "/WEB-INF/jspf/global/footer.jspf" %>
        </div>
    </body>
</html>