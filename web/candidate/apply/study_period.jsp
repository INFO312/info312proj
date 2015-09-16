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
                
                <h2>Apply - Study Period</h2>
                    
                    <p>
                        For each programme application select the study term
                    </p>
                    <p>
                        ---Here will be your programme you selected in the pervious screen---:
                    </p>
                    <form name="form1" action="/PostGradSystem/candidate/apply/study_period.jsp" method="post">
                        <label for="programme">Programme:</label>
                            <select name="programme">
                                <option value =""></option>
                                <option value ="fullTime">Full Time</option>
                                <option value ="PartTime">Part Time</option>
                                <option value ="undecided">Undecided</option>
                            </select>
                        <br>
                        <br>
                        <a href="/PostGradSystem/index.jsp"><button type="button" class="yellowButton">Cancel</button></a>
                        <a href="/PostGradSystem/apply/study_period.jsp"><button type="button" class="yellowButton">Back</button></a>
                        
                        <input type="submit" name="next" id="next" value="Next">
                        
                    
                    </form>
                
            </div>
            
        </div>
    </body>
</html>
