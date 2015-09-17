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
    //Person p = new Person("Mr", r, "User", r, r, r, r, r, r, 'M', "1/1/11");
    String userType = "c";

    if (userType != "c") {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    name = "John Smith";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/WEB-INF/jspf/global-include.jspf" />
        <script src="/PostGradSystem/scripts/root/addDepartmentMember.js" type="text/javascript"></script>
        <link href="/PostGradSystem/css/candidate/style.css" rel="stylesheet" type="text/css">
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
                <p class="genericText">
                    This step is optional and can be completed at a later time.</p>
                <p class="genericText">
                    Specify members of the department that you would like to supervise your study. You may select up to three per programme application. 
                </p>
                <p class="genericText">
                    This is a <b>request only</b> and does not guarantee supervision by the requested department member(s).</p>
                <p class="genericText">
                    <b><a href="http://infosci.otago.ac.nz/our-people/">Look at Department Members Here</a></b>
                </p>
                <fieldset class="loginFormFieldset">
                <legend>Apply - Supervisor Request</legend>

                

                <form name="form4" action="/PostGradSystem/candidate/apply/e_qualifications.jsp" method="post">
                    <p>Master of Science</label><p>
                    
                        <label for="departmentMembers">Department Members</label>
                        <span>
                        <select name="departmentMembers0" class="mytext">
                            <option value =""></option>
                            <option value ="alecHolt">Alec Holt</option>
                            <option value ="brendonWoodford">Brendon Woodford</option>
                            <option value ="grantDick">Grant Dick</option>
                            <option value ="hankWolfe">Hank Wolfe</option>
                            <option value ="holgerRegenbrecht">Holger Regenbrecht</option>
                        </select>  
                        </span>
                        <br>
                        <span>
                        <select name="departmentMembers0" class="mytext">
                            <option value =""></option>
                            <option value ="alecHolt">Alec Holt</option>
                            <option value ="brendonWoodford">Brendon Woodford</option>
                            <option value ="grantDick">Grant Dick</option>
                            <option value ="hankWolfe">Hank Wolfe</option>
                            <option value ="holgerRegenbrecht">Holger Regenbrecht</option>
                        </select>  
                        </span>
                        <br>
                        <br>
                   
                    <button type="button" name="addAnotherDepartmentMember" class="yellowButton addAnotherDepartmentMemberButton">+ Add another Department Member</button>
                    <br>

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
