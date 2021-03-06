<%-- 
    Document   : index
    Created on : Sep 8, 2015, 1:31:14 PM
    Author     : csutton
--%>

<%@page import="resources.Util"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = "";
    String sidebarURL = "";
    
    ArrayList<String> contentIncludeURLs = new ArrayList<>();
    
    // Check if the user is logged in. If no then redirect to login.jsp
    Person p = new Person( "Mr", "Root",  "User", "Root", "Root", "Root", "Root",
    "Root", "Root", 'M' ,Util.convertStringToTimestamp("1900-12-01 00:00:00") );
    
    String userType = "a";
//    String userType = (String)session.getAttribute("userType");
    if (userType == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    } else {
//        Person p = (Person)session.getAttribute("currentUser");
        if(p == null){
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        switch(userType) {
            case "r":
                sidebarURL = "/WEB-INF/jspf/sidebar/root.jspf";
                contentIncludeURLs.add("/WEB-INF/jspf/root/homeContent.jspf");
                break;
            case "a":
                sidebarURL = "/WEB-INF/jspf/sidebar/admin.jspf";
                break;
            case "d":
                sidebarURL = "/WEB-INF/jspf/sidebar/department.jspf";
                break;
            case "c":
                sidebarURL = "/WEB-INF/jspf/sidebar/candidate.jspf";
                break;
        }
        name = p.getFirstname() + " " + p.getLname();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file = "/WEB-INF/jspf/global-include.jspf" %>
        <title><%=name%></title>
    </head>
    <body>
        <div id ="container">
        <jsp:include page="/WEB-INF/jspf/global/header.jspf" flush="true">
            <jsp:param name="name" value="<%= name %>" />
        </jsp:include>
        <jsp:include page="<%= sidebarURL %>" flush="true" />

        <div id="main_content_area">
            <!-- Content Here -->
            <%
            for(String content : contentIncludeURLs) { %>
                <jsp:include page="<%= content %>" flush="true" />
            <% } %>
        </div>
        <%@include file = "/WEB-INF/jspf/global/footer.jspf" %>
        </div>
    </body>
</html>
