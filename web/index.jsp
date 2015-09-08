<%-- 
    Document   : index
    Created on : Sep 8, 2015, 1:31:14 PM
    Author     : csutton
--%>
<%@page import="domain.Person"%>
<%
    String name = "";
    String sidebarURL = "";
    
    // Check if the user is logged in. If no then redirect to login.jsp
    Person p = (Person) session.getAttribute("currentuser");
    String userType = (String) session.getAttribute("usertype");
    if (userType == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    } else {
        name = p.getFirstname() + " " + p.getLname();
        sidebarURL = "/WEB-INF/jspf/sidebar/sidebar_" + userType + ".jspf";
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <base href="${pageContext.request.contextPath}">
        <%@include file = "/WEB-INF/jspf/script_style_include.jspf" %>
        <title>    
        <%=name%>
        </title>
    </head>
    <body>
        <%@include file = "/WEB-INF/jspf/global/header.jspf" %>
        <jsp:include page = "<%=sidebarURL%>" />
    </body>
</html>
