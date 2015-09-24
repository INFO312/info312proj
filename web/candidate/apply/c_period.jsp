<%-- 
    Document   : c_period
    Created on : 15/09/2015, 5:19:20 PM
    Author     : Nathan
--%>

<%@page import="domain.ApplicationSessionObject"%>
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
    //Person p = new Person("Mr", r, "User", r, r, r, r, r, r, 'M', "1/1/11");
    String userType = "c";

    if (userType != "c") {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    name = "John Smith";
    
    String programme = request.getParameter("programme");
    String year = request.getParameter("year"); //  checking integer parse l8r? lolz
    ApplicationSessionObject sess_obj;
    sess_obj = (ApplicationSessionObject)session.getAttribute("app_session_object");
    if(sess_obj == null || programme == null || year == null){
        response.sendRedirect("/PostGradSystem/candidate/apply/a_returning.jsp");
    }else{
        sess_obj.setProgrammeName(programme);
        sess_obj.setProgrammeYear(year);
        session.setAttribute("app_session_object", sess_obj);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/WEB-INF/jspf/global-include.jspf" />
        <title><%=name%></title>
        <link href="/PostGradSystem/css/candidate/style.css" rel="stylesheet" type="text/css">
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
                <fieldset class="loginFormFieldset">
                <legend>Apply - Study Period</legend>
                    
                    <p class="genericText">
                        For each programme application select the study term
                    </p>
                    <p>
                        Master of Science
                    <form name="form3" action="/PostGradSystem/candidate/apply/d_supervisor.jsp" method="post">
                        <label for="programmeLoad">Year:</label>
                        <span>
                            <select name="programmeLoad" class="mytext">
                                <option value =""></option>
                                <option value ="F">Full Time</option>
                                <option value ="P">Part Time</option>
                                <option value ="U">Undecided</option>
                            </select>
                        </span>
                        <br>
                        <br>
                        <input type="submit" name="next" id="next" value="Next" class="yellowButton">
                        <input class="yellowButton" action="action" type="button" value="Back" onclick="history.go(-1);" />
                        <a href="/PostGradSystem/index.jsp"><button type="button" class="yellowButton">Cancel</button></a>
                        
                        
                    
                    </form>
                </fieldset>
                
            </div>
            
        </div>
    </body>
</html>
