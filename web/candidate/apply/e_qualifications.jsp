<%-- 
    Document   : e_qualifications
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
                    <h2>Apply - Attained Qualifications</h2>
                    
                    <p>
                        Enter the qualifications you have previously attained and the year completed
                    </p>
                    <p>
                        E.g. Bachelor of Science (BSc)
                    </p>
                    <form name="form1" action="/PostGradSystem/candidate/apply/f_documents.jsp" method="post">
                        <label for="qualifications">Qualifications:</label>
                            <input name="qualifications" type="text">
                        
                        <label for="year">Year:</label>
                            <select name="year">
                                <option value =""></option>
                                <option value ="2000">2000</option>
                                <option value ="2001">2001</option>
                                <option value ="2002">2002</option>
                                <option value ="2003">2003</option>
                                <option value ="2004">2004</option>
                                <option value ="2005">2005</option>
                                <option value ="2006">2006</option>
                                <option value ="2007">2007</option>
                                <option value ="2008">2008</option>
                                <option value ="2009">2009</option>
                                <option value ="2010">2010</option>
                                <option value ="2011">2011</option>
                                <option value ="2012">2012</option>
                                <option value ="2013">2013</option>
                                <option value ="2014">2014</option>
                                <option value ="2015">2015</option>
                            </select>
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
