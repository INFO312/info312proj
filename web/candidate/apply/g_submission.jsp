<%-- 
    Document   : g_submission
    Created on : 17/09/2015, 11:13:22 AM
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
                <h2>Apply - Submission</h2>

                <p>
                    By submitting this application for postgraduate study with the Department of Information Science at the University of Otago you agree the all information provided is correct and true. 
                </p>

                <form name="form1" method="post" action="/PostGradSystem/index.jsp" onsubmit="if (document.getElementById('agree').checked) {
                            return true;
                        } else {
                            alert('Please indicate that you have read and agree to the Terms and Conditions and Privacy Policy');
                            return false;
                        }">
                    <input type="checkbox" name="checkbox" value="check" id="agree" /> I have read and agree to the Terms and Conditions and Privacy Policy
                    <br>
                    <br>

                    <a href="/PostGradSystem/index.jsp"><button type="button" class="yellowButton">Cancel</button></a>
                    <input class="yellowButton" action="action" type="button" value="Back" onclick="history.go(-1);" />
                    <input class="yellowButton" type="submit" name="next" id="next" value="Next"/>

                </form>
            </div>
        </div>
    </body>
</html>
