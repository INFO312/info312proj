<%-- 
    Document   : index
    Created on : Sep 11, 2015, 11:45:13 AM
    Author     : csutton
--%>
<%@page import="domain.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = "";
    String sidebarURL = "";
    // Check if the user is logged in. If no then redirect to login.jsp
//    Person p = (Person) session.getAttribute("currentuser");
//    String userType = (String) session.getAttribute("usertype");
    String r = "admin";
    Person p = new Person("Mr", r, "User", r, r, r, r, r, r, 'M', "1/1/11");
    String userType = "a";
    if (userType != "a") {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    name = p.getFirstname() + " " + p.getLname();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <jsp:include page="/WEB-INF/jspf/global-include.jspf" />
        <link href="/PostGradSystem/css/application.css" rel="stylesheet" type="text/css" />
        <script src="/PostGradSystem/scripts/applicationDocumentToggle.js"></script>
        <title><%=name%></title>
    </head>
    <body>
        <div id ="container">
            <jsp:include page="/WEB-INF/jspf/global/header.jspf" flush="true">
                <jsp:param name="name" value="<%= name%>" />
            </jsp:include>
            <jsp:include page="/WEB-INF/jspf/sidebar/admin.jspf" flush="true" />
            
            <div id="main_content_area">
                <h2 class="float-left">FNAME LNAME - QUALIFICATION</h2>
                <p class="float-right">STUDENTIDNUMBER</p>
                <p class="clear">Commencing Study: <span>YEAR</span></p>
                <p>Full Time Student: <span>T/F</span></p>
                <p>Obtained Qualifications:</p>
                <ul>
                    <li>QUALIFICATION</li>
                </ul>
                
                <div class="applicationDoucment">
                    <h3 class="documentHeader">Academic Transcript</h3>
                    <button class="applicationShowHide" type="button" name="showTranscript" >Show</button>
                    <hr>
                    <iframe data-src="/PostGradSystem/placeholders/cv.pdf"></iframe>
                </div>
                
                <div class="applicationDoucment">
                    <h3 class="documentHeader">Personal Statement</h3>
                    <button class="applicationShowHide" type="button" name="showTranscript" >Show</button>
                    <hr>
                    <iframe data-src="/PostGradSystem/placeholders/cv.pdf"></iframe>
                </div>
                
                <div class="applicationDoucment">
                    <h3 class="documentHeader">Additional Information</h3>
                    <button class="test2 applicationShowHide" type="button" name="showTranscript" >Show</button>
                    <hr>
                    <iframe data-src="/PostGradSystem/placeholders/cv.pdf"></iframe>
                </div>
                    
                <div class="applicationDoucment">
                    <h3 class="documentHeader">Supplementary Documents</h3>
                    <button class="test2 applicationShowHide" type="button" name="showTranscript" >Show</button>
                    <hr>
                    <iframe data-src="/PostGradSystem/placeholders/cv.pdf"></iframe>
                </div>
                    
                <h3>Supervisors</h3>
                
                <table class="applicationSummaryTable">
                    <tr>
                        <td class="applicationName" colspan="3"><a href="/PostGradSystem/admin/applicationManagement/application.jsp">FNAME LNAME</a></td>
                    </tr>
                    <tr>
                        <td class="applicationQualification" colspan="3">Master of Business Data Science (2015)</td>
                    </tr>
                    <tr>
                        <td>Application Complete</td>
                        <td>Complete</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td>Documents Verified</td>
                        <td>Incomplete</td>
                        <td>Invalid documents received</td>
                    </tr>
                    <tr>
                        <td>Course Approved</td>
                        <td>Complete</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td>Supervisor Status</td>
                        <td>Complete</td>
                        <td>Appointed Grant Dick</td>
                    </tr>
                    <tr>
                        <td>External Approval</td>
                        <td>N/A</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td>HOD Approval</td>
                        <td>Incomplete</td>
                        <td>Awaiting correct documentation</td>
                    </tr>
                    <tr>
                        <td colspan="3">Incomplete - Work Required</td>
                    </tr>
                </table>
                
            </div>
            <%@include file = "/WEB-INF/jspf/global/footer.jspf" %>
        </div>
    </body>
</html>