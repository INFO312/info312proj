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
        <link href="/PostGradSystem/css/admin/applicationSummaryTable.css" rel="stylesheet" type="text/css" />
        <title><%=name%></title>
    </head>
    <body>
        <div id ="container">
            <jsp:include page="/WEB-INF/jspf/global/header.jspf" flush="true">
                <jsp:param name="name" value="<%= name%>" />
            </jsp:include>
            <jsp:include page="/WEB-INF/jspf/sidebar/admin.jspf" flush="true" />
            
            <div id="main_content_area">
                <nav class="subnav">
                    <h2>Application Management</h2>
                    <ul>
                        <li class="subnav-item active">
                            <a href="/PostGradSystem/admin/applicationManagement/index.jsp">Attention Required</a>
                        </li>
                        <li class="subnav-item">
                            <a href="/PostGradSystem/admin/applicationManagement/new.jsp">New Applications</a>
                        </li>
                        <li class="subnav-item">
                            <a href="/PostGradSystem/admin/applicationManagement/current.jsp">Current Applications</a>
                        </li>
                        <li class="subnav-item">
                            <a href="/PostGradSystem/admin/applicationManagement/history.jsp">Application History</a>
                        </li>
                        <li class="subnav-item">
                            <a href="/PostGradSystem/admin/applicationManagement/search.jsp">Search Applications</a>
                        </li>
                    </ul>
                </nav>

                <h3>20 August 2014</h3>
                
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
                
                <table class="applicationSummaryTable">
                    <tr>
                        <td class="applicationName" colspan="3">FNAME LNAME</td>
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