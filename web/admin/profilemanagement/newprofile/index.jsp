<%-- 
    Document   : index
    Created on : 12/09/2015, 4:00:10 PM
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
    String r = "admin";
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
                    <h2>Create New Department Member Profile</h2>
                    <ul>
                        <li>
                            <span>Create New Profile</span>
                        </li>
                        <li>
                            <a href="/PostGradSystem/admin/profilemanagement/manageprofile/index.jsp"><span>Manage Profiles</span></a>
                        </li>
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

                        <button type="button" name="addAnotherQualification" class="yellowButton ">+ Add another qualification</button>
                        <br>


                        <label for="publications">Publications</label>
                        <br>
                        <textarea name="fname"></textarea>
                        <br>


                        <label for="otherInformation">Other Information</label>
                        <br>
                        <textarea name="fname"></textarea>
                        </div>
                        <input type="submit" name="createDepartmentMember" class="yellowButton" value="Create Department Member">

                    
                </form>

                <nav id="subnav">
                    <h2>Create New Candidate Profile</h2>
                </nav>

                <form id="createMember" action="/PostGradSystem/RegisterServlet" method="post">
                    

                    <div class="float-left">
                        <label for="email">Email</label>
                            <br>
                            <input name="email" type="text">
                        <br>
                        
                        <label for="title">Title</label>
                            <br>
                            <input name="title" type="text">
                        <br>
                        
                        <label for="middlename">Middle Name</label>
                            <br>
                            <input name="middlename" type="text">
                        <br>
                        
                    </div>

                    <div class="float-right">
                        <label for="password">Password</label>
                            <br>
                            <input name="password" type="password">
                        <br>
                        
                        <label for="firstname">First Name</label>
                            <br>
                            <input name="firstname" type="text">
                        <br>
                        
                        <label for="lastname">Last Name</label>
                            <br>
                            <input name=lastname type="text">
                        <br>

                    </div>

                    <div class="clear">

                        <label for="address">Address</label>
                        <br>
                        <input name="address" type="text">
                        <br>

                    </div>

                    <div class="float-left">

                        <label for="homephone">Home Phone</label>
                        <br>
                        <input name="homephone" type="number">
                        <br>
                        
                        <label for="workphone">Work Phone</label>
                        <br>
                        <input name="workphone" type="number">
                        <br>
                        
                        <label for ="dob">Date of Birth: (Day/Month/Year)</label>
                        <br>
                        <input type="text" id="datepicker" name="dob">

                    </div>

                    <div class="float-right">
                        <label for="mobile">Mobile</label>
                        <br>
                        <input name="mobile" type="number">
                        <br>   
                        
                        <label for="gender">Gender
                            <select name="gender">
                                <option value="m">Male</option>
                                <option value="f">Female</option>
                            </select>
                        </label>
                        <br>
                        
                    </div>
                    
                    <div class="break">
                        <input type="submit" name="register" class="yellowButton" value="Register">
                        </div>
                        
                    
                </form>

            </div>

            <%@include file = "/WEB-INF/jspf/global/footer.jspf" %>
        </div>
    </body>
</html>
