<%-- 
    Document   : index
    Created on : Sep 11, 2015, 11:45:13 AM
    Author     : nblomfield
--%>
<%@page import="resources.Util"%>
<%@page import="domain.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Person p = new Person( "Mr", "Root",  "User", "Root", "Root", "Root", "Root",
        "Root", "Root", 'M' ,Util.convertStringToTimestamp("1900-12-01 00:00:00") );
    String userType = "a";
    
    if (userType != "a") {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    String name = p.getFirstname() + " " + p.getLname();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <jsp:include page="/WEB-INF/jspf/global-include.jspf" />
        <link href="/PostGradSystem/css/admin/manageForm.css" rel="stylesheet" type="text/css" />
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
                    <h2>Manage Candidate Profiles</h2>
                    <ul>
                        <li class="subnav-item">
                            <a href="/PostGradSystem/admin/profilemanagement/newProfile.jsp">Create New Profile</a>
                        </li>
                        <li class="subnav-item active">
                            <a href="/PostGradSystem/admin/profilemanagement/index.jsp">Manage Profiles</a>
                        </li>
                    </ul>
                </nav>
                
                <div class="tooltip">
                    <p>This pages allows for the management of candidate profiles in the portal. You can edit the details of any candidates profile and delete profiles if required.</p>
                    <ul>
                        <li>To edit a candidates profile navigate to their name below and click the edit button.</li>
                        <li>To delete a candidates profile navigate to their name below and click the delete button.</li>
                    </ul> 
                    <p>If you require the addition of a department member or the modification of a department members access level you must log in with root access.</p>
                    
                    <p class="warningParagraph"><span class="warning">Warning:</span> Any changes made including deletions are <em>permanent</em> therfore take care.</p>
                    
                </div>

                <div id="manageDeparment">

                    
                    <div class="float-left">
                        <ul>
                            <li>
                                FNAME LNAME
                                <button type="button" name="FNAME LNMAME" class="yellowButton">Edit</button>
                                <button type="button" name="FNAME LNMAME" class="yellowButton">Delete</button>
                            </li>

                            <li>
                                FNAME LNAME
                                <button type="button" name="FNAME LNMAME" class="yellowButton">Edit</button>
                                <button type="button" name="FNAME LNMAME" class="yellowButton">Delete</button>
                            </li>
                        </ul>
                    </div>
                        
                    <div class="float-right">
                        <ul>
                            <li>
                                FNAME LNAME
                                <button type="button" name="FNAME LNMAME" class="yellowButton">Edit</button>
                                <button type="button" name="FNAME LNMAME" class="yellowButton">Delete</button>
                            </li>

                            <li>
                                FNAME LNAME
                                <button type="button" name="FNAME LNMAME" class="yellowButton">Edit</button>
                                <button type="button" name="FNAME LNMAME" class="yellowButton">Delete</button>
                            </li>
                         </ul>
                    </div>
                </div>

            </div>
            <%@include file = "/WEB-INF/jspf/global/footer.jspf" %>
        </div>
    </body>
</html>