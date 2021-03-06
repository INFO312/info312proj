<%-- 
    Document   : f_documents
    Created on : 17/09/2015, 11:04:26 AM
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
        <script src="scripts/redirect.js"></script>
        <title><%=name%></title>
        <script src="/PostGradSystem/scripts/root/addAnotherQualification.js" type="text/javascript"></script>
        <link href="/PostGradSystem/css/admin/form.css" type="text/css" rel="stylesheet">
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
                        Upload required documentation for your application(s) and add any supplementary documentation that may aid in the success of application. 
                    </p>
                    <p class="genericText">
                        If you have uploaded an academic transcript before you will be able to reuse that document for this application, although you are free to upload a recent revision. 
                    </p>
                    <fieldset class="registerFormFieldset">
                        <legend>Apply - Document Upload - DISABLED!</legend>
                    <form name="form6" action="/PostGradSystem/candidate/apply/g_submission.jsp" method="post" class="form-green">
                        
                        <label for="academicTranscript"><b>Academic Transcript:</b></label>
                        <input type="file" name="academicTranscript" size="chars"> 
                        <br>
                        <br>
                        <label for="supplementaryDocuments"><b>Supplementary Documents:</b></label>
                            <input type="file" name="supplementaryDocuments" size="chars">   
                        <br>
                        <br>
                        <label for="additionalDocuments"><b>Additional Documents:</b></label>
                            <input type="file" name="additionalDocuments" size="chars">
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
