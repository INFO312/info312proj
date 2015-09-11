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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/WEB-INF/jspf/global-include.jspf" />
        <title><%=name%></title>
    </head>
    <body>
        <div id="container">
            <jsp:include page="/WEB-INF/jspf/global/header.jspf" flush="true">
                <jsp:param name="name" value="<%= name %>" />
            </jsp:include>
            <jsp:include page="/WEB-INF/jspf/sidebar/root.jspf" flush="true" />  
            <div id="wrapper">
                <nav id="subnav">
                    <h2>Manage Department Members</h2>
                    <ul>
                        <li>Create</li>
                        <li>Manage</li>
                    </ul>
                </nav>

                <form id="createMember" action="" method="post">
                    <label for="fname">First Name</label>
                    <input name="fname" type="text">

                    <label for="fname">Middle Name</label>
                    <input name="fname" type="text">

                    <label for="fname">Last Name</label>
                    <input name="fname" type="text">

                    <label for="fname">Address</label>
                    <input name="fname" type="text">

                    <label for="fname">Email</label>
                    <input name="fname" type="text">

                    <label for="fname">Mobile Phone</label>
                    <input name="fname" type="text">

                    <label for="fname">Home Phone</label>
                    <input name="fname" type="text">

                    <label for="fname">Work Phone</label>
                    <input name="fname" type="text">

                    <label for="fname">Gender</label>
                    <input name="fname" type="text">

                    <label for="fname">Date of Birth</label>
                    <input name="fname" type="text">

                    <label for="fname">Other Information</label>
                    <textarea name="fname"></textarea>

                    <label for="fname">Publications</label>
                    <textarea name="fname"></textarea>

                    <label for="fname">Access Level</label>
                    <select name="fname">
                        <option value =""></option>
                    </select>

                    <label for="fname">Qualifications</label>
                    <select name="fname">
                        <option value =""></option>
                    </select>

                    <button type="button">+ Add another qualification</button>
                </form>
            </div>
        </div>
    </body>
</html>
