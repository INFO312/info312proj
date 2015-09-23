<%-- 
    Document   : e_qualifications
    Created on : 15/09/2015, 4:18:27 PM
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
    
    String preferredDepartmentMember = request.getParameter("departmentMembers0");
    ApplicationSessionObject sess_obj;
    sess_obj = (ApplicationSessionObject)session.getAttribute("app_session_object");
    if(sess_obj == null || preferredDepartmentMember == null){
        response.sendRedirect("/PostGradSystem/candidate/apply/a_returning.jsp");
    }else{
        sess_obj.setPreferredSupervisor(preferredDepartmentMember);
        session.setAttribute("app_session_object", sess_obj);
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/WEB-INF/jspf/global-include.jspf" />
        <link href="/PostGradSystem/css/admin/form.css" type="text/css" rel="stylesheet">
        <script src="scripts/redirect.js"></script>
        <title><%=name%></title>
        <script src="/PostGradSystem/scripts/root/candidateQualifications.js" type="text/javascript"></script>
    </head>
    <body>
        <div id ="container">
            <jsp:include page="/WEB-INF/jspf/global/header.jspf" flush="true">
                <jsp:param name="name" value="<%= name%>" />
            </jsp:include>
            <jsp:include page="/WEB-INF/jspf/sidebar/candidate.jspf" flush="true" />  
            <div id="main_content_area">
                
                  
                    
                    <p>
                        Enter the qualifications you have previously attained and the year completed
                    </p>
                    <p>
                        E.g. Bachelor of Science (BSc)
                    </p>
                    <fieldset class="registerFormFieldset">
                        <legend>Apply - Attained Qualifications</legend>
                    <form name="form5" action="/PostGradSystem/candidate/apply/g_submission.jsp" method="post" class="form-green">
                        
                        <div id="qualificationSelectorContainer0">
                           
                        </div>
                        <div id='TextBoxesGroup'>
                            <label>Select a Supervisor: </label>
                            <div id="TextBoxDiv1">
                                <label for="qualifications">Qualifications:</label>
                            <input name="qualifications" type="text">
                            <br>
                        
                        <label for="year">Year:</label>
                            <input type="text" name="textbox' id="textbox value="" >
                            </div>
                        </div>
                        <input type='button' value='Add Qualification' id='addButton' class="yellowButton">
                        <input type='button' value='Remove Qulification' id='removeButton' class="yellowButton">
                        <br>
                        <br>
                        
                        
                        <input class="yellowButton" type="submit" name="next" id="next" value="Next">
                        
                        <input class="yellowButton" action="action" type="button" value="Back" onclick="history.go(-1);" />
                        <a href="/PostGradSystem/index.jsp"><button type="button" class="yellowButton">Cancel</button></a>
                        
                        
                        
                    
                    </form>
                    </fieldset>
            </div>
        </div>
    </body>
</html>
