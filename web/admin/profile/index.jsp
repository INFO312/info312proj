<%-- 
    Document   : index
    Created on : Sep 18, 2015, 3:13:33 PM
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
