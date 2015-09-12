<%-- 
    Document   : index
    Created on : Sep 11, 2015, 11:45:13 AM
    Author     : csutton
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
    
    String r = "root";
    Person p = new Person( "Mr", r,  "User", r, r, r, r, r, r, 'M', "1/1/11");
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <jsp:include page="/WEB-INF/jspf/global-include.jspf" />
        <link href="/PostGradSystem/css/root/manageForm.css" rel="stylesheet" type="text/css" />
        <title><%=name%></title>
    </head>
    <body>
        <div id="container">
            <jsp:include page="/WEB-INF/jspf/global/header.jspf" flush="true">
                <jsp:param name="name" value="<%= name %>" />
            </jsp:include>
            <jsp:include page="/WEB-INF/jspf/sidebar/root.jspf" flush="true" />  
            <div id="wrapper">
                <nav class="subnav">
                    <h2>Manage Department Members</h2>
                    <ul>
                        <li>Create</li>
                        <li>Manage</li>
                    </ul>
                </nav>

                <form id="createMember" action="" method="post">
                    <div class="float-left">
                        <label for="fname">First Name</label>
                        <br>
                        <input name="fname" type="text">
                        <br>

                        <label for="mname">Middle Name</label>
                        <br>
                        <input name="lname" type="text">
                        <br>
                        
                        <label for="mname">Last Name</label>
                        <br>
                        <input name="lname" type="text">
                        <br>
                        

                        <label for="access">Access Level</label>
                        <br>
                        <select name="access">
                            <option value ="d">Department Member</option>
                            <option value ="a">Administrator</option>
                        </select>
                        <br>
                        
                        
                        <label for="genre">Gender</label>
                        <br>
                        <input name="fname" type="text">
                    </div>
                    
                    <div class="float-right">

                        <label for="email">Email</label>
                        <br>
                        <input name="fname" type="text">
                        <br>
                        

                        <label for="mphone">Mobile Phone</label>
                        <br>
                        <input name="fname" type="text">
                        <br>
                        

                        <label for="hphone">Home Phone</label>
                        <br>
                        <input name="fname" type="text">
                        <br>
                        

                        <label for="wphone">Work Phone</label>
                        <br>
                        <input name="fname" type="text">
                        <br>
                            
                        <label for="dob">Date of Birth</label>
                        <br>
                        <input name="fname" type="text">
                        <br>
                    
                    </div>
                    
                    
                    <div class="clear">
                    
                        <label for="address">Address</label>
                        <br>
                        <input name="address" type="text">
                        <br>
                        
                        
                        <label for="qualifications">Qualifications</label>
                        <br>
                        <select name="qualifications">
                            <option value =""></option>
                        </select>
                        <br>
                        
                        <button type="button" name="addAnotherQualification">+ Add another qualification</button>
                        <br>
                        
                        
                        <label for="publications">Publications</label>
                        <br>
                        <textarea name="fname"></textarea>
                        <br>
                        

                        <label for="otherInformation">Other Information</label>
                        <br>
                        <textarea name="fname"></textarea>
                        
                    </div>
                </form>
                
                <div id="manageDeparment">
                    
                    <ul>
                        <li>
                            FNAME LNAME
                            <button type="button" name="FNAME LNMAME" class="editDepartmentButton">Edit</button>
                            <button type="button" name="FNAME LNMAME" class="deleteDepartmentButton">Delete</button>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </div>
    </body>
</html>
