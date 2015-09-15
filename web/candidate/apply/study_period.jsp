<%-- 
    Document   : study_period
    Created on : 15/09/2015, 5:19:20 PM
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
    String r = "candidate";
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
        <title><%=name%></title>
    </head>
    <body>
        <div id ="container">
            <jsp:include page="/WEB-INF/jspf/global/header.jspf" flush="true">
                <jsp:param name="name" value="<%= name%>" />
            </jsp:include>
            <jsp:include page="/WEB-INF/jspf/sidebar/candidate.jspf" flush="true" />  
            <div id="main_content_area">
                <nav id="subnav">
                </nav>
                
                <p>For each programme application select the study term</p>
                
                
                
            </div>
            
        </div>
    </body>
</html>
