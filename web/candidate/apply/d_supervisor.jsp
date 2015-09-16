<%-- 
    Document   : d_supervisor
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
        <script src="/PostGradSystem/scripts/root/createDepartmentMemberValidation.js" type="text/javascript"></script>
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
                
                <h2>Apply - Supervisor Request</h2>
                    
                    <p>
                        This step is optional and can be completed at a later time.
                    <p>
                        Specify members of the department that you would like to supervise your study. You may select up to three per programme application. 
                    <p>
                        This is a <b>request only</b> and does not guarantee supervision by the requested department member(s).
                    <p>
                        <b><a href="http://infosci.otago.ac.nz/our-people/">Look at Department Members Here</a></b>
                    </p>
                  
                    <form name="form1" action="/PostGradSystem/candidate/apply/study_period.jsp" method="post">
                        <label for="supervisor">---Here will be your programme you selected---:</label>
                        
                        <input hidden type="text" id="hiddenDepartmentMemberCounter" name="departmentMemberCounter">
        
        <div id="departmentMemberSelectorContainer0">
            <label for="departmentMembers">Department Members</label>
            <br>
            <select name="departmentMembers0" class="departmentMemberSelector">
                <option value =""></option>
                <option value ="masterOfScience">a</option>
                <option value ="masterOfBusiness">b</option>
                <option value ="masterOfBusinessAdministration">Master of Business Administration</option>
                <option value ="masterOfBusinessDataScience">Master of Business Data Science</option>
            </select>  
            <br>
        </div>
                        <button type="button" name="addAnotherDepartmentMember" class="yellowButton addAnotherDepartmentMemberButton">+ Add another Department Member</button>
        <br>
                        
                        <br>
                        <br>
                        <a href="/PostGradSystem/index.jsp"><button type="button" class="yellowButton">Cancel</button></a>
                        <input class="yellowButton" action="action" type="button" value="Back" onclick="history.go(-1);" />
                        
                        <input type="submit" name="next" id="next" value="Next" class="yellowButton">
                        
                    
                    </form>
                
            </div>
            
        </div>
    </body>
</html>
