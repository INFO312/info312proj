<%-- 
    Document   : b_apply
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
        <script src="/PostGradSystem/scripts/root/addAnotherQualification.js" type="text/javascript"></script>
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
                    <h2>Apply - Programme Selection</h2>
                    
                    <p>
                        Type the name of the programme you wish to apply for and select a preferred year of study
                    </p>
                    <p>
                        E.g. Master of Science (MSc)
                    </p>
                    <form name="form1" action="/PostGradSystem/candidate/apply/c_period.jsp" method="post">
                        <label for="programme">Programme:</label>
                            <select name="programme">
                                <option value =""></option>
                                <option value ="masterOfScience">Master of Science</option>
                                <option value ="masterOfBusinessDataScience">Master of Business Data Science</option>
                                <option value ="masterOfBusinessAdministration">Master of Business Administration</option>
                                <option value ="masterOfBusiness">Master of Business</option>
                            </select>
                        
                        <label for="year">Year:</label>
                            <select name="year">
                                <option value =""></option>
                                <option value ="2015">2015</option>
                                <option value ="2016">2016</option>
                                <option value ="2017">2017</option>
                                <option value ="2018">2018</option>
                            </select>
                        <br>
                        <br>
                        <button type="button" name="addAnotherQualification" class="yellowButton addAnotherQualificationButton">+ Add another programme</button>
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
