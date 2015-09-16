<%-- 
    Document   : a_returning
    Created on : 15/09/2015, 4:18:27 PM
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
        <script src="scripts/redirect.js"></script>
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
                    <h2>Apply - Returning Otago Student</h2>
                   
                    <form name="form1" action="/PostGradSystem/candidate/apply/b_apply.jsp" method="post">
                        <label for="programme">Are you currently or have you previously studied at the University of Otago?:</label>
                            <select name="yesno">
                                <option value =""></option>
                                <option value ="yes">Yes</option>
                                <option value ="no">No</option>
                            </select>
                        <label for="studentNumberCode">Student Number Code:</label>
                            <input name="studentNumberCode" type="text">
                            <br>
                        <br>
                        <br>
                        <a href="/PostGradSystem/index.jsp"><button type="button" class="yellowButton">Cancel</button></a>
                        <input class="yellowButton" action="action" type="button" value="Back" onclick="history.go(-1);" />
                        
                        <input class="yellowButton" type="submit" name="next" id="next" value="Next">
                        
                    
                    </form>
            </div>
        </div>
    </body>
</html>
