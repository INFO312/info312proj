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
    String r = "root";
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
        <title><%=name%></title>
    </head>
    <body>
        <div id ="container">
            <jsp:include page="/WEB-INF/jspf/global/header.jspf" flush="true">
                <jsp:param name="name" value="<%= name%>" />
            </jsp:include>
            <jsp:include page="/WEB-INF/jspf/sidebar/root.jspf" flush="true" />  
            <div id="main_content_area">
                <nav id="subnav">
                    <h2>Manage Department Access Levels</h2>
                </nav>

                <table style="width:100%">
                    <tr>
                        <td>Heather Cooper</td>
                        <td><label for="fname">Access Level</label>
                            <select name="fname">
                                <option value ="Admin">Admin</option>
                                <option value ="Staff">Staff</option>
                                <option value ="HOD">HOD</option>
                                <option value ="PG Advisor">PG Advisor</option>
                            </select></td> 
                    </tr>
                    <tr>
                        <td>Michael Winikoff</td>
                        <td><label for="fname">Access Level</label>
                            <select name="fname">
                                <option value ="HOD">HOD</option>
                                <option value ="Admin">Admin</option>
                                <option value ="Staff">Staff</option>
                                <option value ="PG Advisor">PG Advisor</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Alec Holt</td>
                        <td><label for="fname">Access Level</label>
                            <select name="fname">
                                <option value ="Staff">Staff</option>
                                <option value ="Admin">Admin</option>
                                <option value ="HOD">HOD</option>
                                <option value ="PG Advisor">PG Advisor</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Brendon Woodford</td>
                        <td><label for="fname">Access Level</label>
                            <select name="fname">
                                <option value ="Staff">Staff</option>
                                <option value ="Admin">Admin</option>
                                <option value ="HOD">HOD</option>
                                <option value ="PG Advisor">PG Advisor</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Grant Dick</td>
                        <td><label for="fname">Access Level</label>
                            <select name="fname">
                                <option value ="Staff">Staff</option>
                                <option value ="Admin">Admin</option>
                                <option value ="HOD">HOD</option>
                                <option value ="PG Advisor">PG Advisor</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Hank Wolfe</td>
                        <td><label for="fname">Access Level</label>
                            <select name="fname">
                                <option value ="Staff">Staff</option>
                                <option value ="Admin">Admin</option>
                                <option value ="HOD">HOD</option>
                                <option value ="PG Advisor">PG Advisor</option>

                            </select></td>
                    </tr>
                    <tr>
                        <td>Holger Regenbrecht</td>
                        <td><label for="fname">Access Level</label>
                            <select name="fname">
                                <option value ="Staff">Staff</option>
                                <option value ="Admin">Admin</option>
                                <option value ="HOD">HOD</option>
                                <option value ="PG Advisor">PG Advisor</option>
                            </select></td>
                    </tr>             
                </table>
                <br>

                <button type="button">Discard Changes</button>
                <button type="button">Save Changes</button>
                </form>
            </div>
            <%@include file = "/WEB-INF/jspf/global/footer.jspf" %>
    </div>
    </body>
</html>
