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
        <link href="/PostGradSystem/css/admin/applicationSummaryTable.css" rel="stylesheet" type="text/css" />
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
                <div id="applicationWrapper">
                    <h2 class="float-left">John Smith - Master of Science</h2>
                    <p class="float-right">2736642</p>
                    <p class="clear">Commencing Study: <span>2016</span></p>
                    <p>Full Time Student: <span>True</span></p>
                    <p>Obtained Qualifications:</p>
                    <ul>
                        <li>Bachelor of Science</li>
                        <li>PostGraduate Diploma in Business</li>
                    </ul>
                    
                    <h3>Summary + Actions</h3>
                    <table class="applicationSummaryTable">
                        <tr>
                            <th>Item</th>
                            <th>Status</th>
                            <th>Message</th>
                            <th>Action</th>
                        </tr>
                        <tr class="astGreen">
                            <td>Initial Application</td>
                            <td>Complete</td>
                            <td>-</td>
                            <td><button type="button" name="" disabled>Complete Item</button></td>
                        </tr>
                        <tr class="astYellow">
                            <td>Documents Verified</td>
                            <td>Incomplete</td>
                            <td>Invalid documents received</td>
                            <td><button type="button" name="">Complete Item</button></td>
                        </tr>
                        <tr class="astGreen">
                            <td>Course Approved</td>
                            <td>Complete</td>
                            <td>-</td>
                            <td><button type="button" name="" disabled>Complete Item</button></td>
                        </tr>
                        <tr class="astGreen">
                            <td>Supervisor Status</td>
                            <td>Complete</td>
                            <td>Appointed Grant Dick</td>
                            <td><button type="button" name="" disabled>Complete Item</button></td>
                        </tr>
                        <tr class="astGreen">
                            <td>External Approval</td>
                            <td>N/A</td>
                            <td>-</td>
                            <td><button type="button" name="" disabled>Complete Item</button></td>
                        </tr>
                        <tr class="astYellow">
                            <td>HOD Approval</td>
                            <td>Incomplete</td>
                            <td>Awaiting correct documentation</td>
                            <td><button type="button" name="" disabled>Complete Item</button></td>
                        </tr>
                        <tr class="astYellow bottomTableRow">
                            <td colspan="4">Incomplete - Work Required</td>
                        </tr>
                    </table>

                    <div class="applicationDocument">
                        <h3 class="documentHeader">Academic Transcript</h3>
                        <button class="applicationShowHide yellowButton" type="button" name="showTranscript" >Show</button>
                        <hr>
                        <iframe data-src="/PostGradSystem/placeholders/ar.pdf"></iframe>
                    </div>

                    <div class="applicationDocument">
                        <h3 class="documentHeader">Personal Statement</h3>
                        <button class="applicationShowHide yellowButton" type="button" name="showTranscript" >Show</button>
                        <hr>
                        <iframe data-src="/PostGradSystem/placeholders/cl.pdf"></iframe>
                    </div>

                    <div class="applicationDocument">
                        <h3 class="documentHeader">Curriculum Vitae</h3>
                        <button class="applicationShowHide yellowButton" type="button" name="showTranscript" >Show</button>
                        <hr>
                        <iframe data-src="/PostGradSystem/placeholders/cv.pdf"></iframe>
                    </div>

                    <div class="applicationDocument">
                        <h3 class="documentHeader">Additional Information</h3>
                        <button class="applicationShowHide" type="button" name="showTranscript" disabled>No Document to Show</button>
                        <hr>
                        <iframe data-src="/PostGradSystem/placeholders/cv.pdf"></iframe>
                    </div>

                    <div class="applicationDocument">
                        <h3 class="documentHeader">Supplementary Documents</h3>
                        <button class="applicationShowHide" type="button" name="showTranscript" disabled>No Document to Show</button>
                        <hr>
                    </div>

                    <h3>Supervisors</h3>
                    <table id='supervisorTable'>
                        <tr>
                            <td>Grant Dick </td>
                            <td><button type="button" class='yellowButton'>Decline</button></td>
                            <td><button type="button" class='yellowButton'>Accept</button></td>
                        </tr>
                        <tr>
                            <td>Brendon Woodford</td>
                            <td><button type="button" class='yellowButton'>Decline</button></td>
                            <td><button type="button" class='yellowButton'>Accept</button></td>
                        </tr>
                        <tr>
                            <td colspan='4'><button type="button" class='yellowButton'>Add interested supervisor</button></td>
                        </tr>
                    </table>
                    
                </div>
            </div>
            <%@include file = "/WEB-INF/jspf/global/footer.jspf" %>
        </div>
    </body>
</html>