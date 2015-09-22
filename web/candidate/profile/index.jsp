<%-- 
    Document   : index
    Created on : Sep 8, 2015, 1:31:14 PM
    Author     : csutton
--%>

<%@page import="resources.Util"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String userType = "c";

    if (userType != "c") {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    String name = "John Smith";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file = "/WEB-INF/jspf/global-include.jspf" %>
        <title><%=name%></title>
    </head>
    <body>
        <div id ="container">
            <jsp:include page="/WEB-INF/jspf/global/header.jspf" flush="true">
                <jsp:param name="name" value="<%= name%>" />
            </jsp:include>
            <jsp:include page="/WEB-INF/jspf/sidebar/candidate.jspf" flush="true" />

            <div id="main_content_area">
                
                <div class="tooltip">
                    <p>This page allows you edit the information on your profile. To edit an item click the corresponding <em>Edit</em>button. This will display an editable box where you can enter a new value.</p>
                    <p>Click the <em>Save</em> button at any time to save the chages you have made.</p>
                    
                    <p class="warningParagraph"><span class="warning">Warning:</span> Any changes made are <em>permanent</em> therfore take care.</p>
                </div>
                <table>
                    <tr>
                        <td>Email</td>
                        <td></td>
                        <td><button type="button" name="">Edit</button></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td></td>
                        <td><button type="button" name="">Edit</button></td>
                    </tr>
                    <tr>
                        <td>Title</td>
                        <td></td>
                        <td><button type="button" name="">Edit</button></td>
                    </tr>
                    <tr>
                        <td>First Name</td>
                        <td></td>
                        <td><button type="button" name="editFirstName">Edit</button></td>
                    </tr>
                    <tr>
                        <td>Middle Name</td>
                        <td></td>
                        <td><button type="button" name="">Edit</button></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td></td>
                        <td><button type="button" name="">Edit</button></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td></td>
                        <td><button type="button" name="">Edit</button></td>
                    </tr>
                    <tr>
                        <td>Mobile Phone</td>
                        <td></td>
                        <td><button type="button" name="">Edit</button></td>
                    </tr>
                    <tr>
                        <td>Home Phone</td>
                        <td></td>
                        <td><button type="button" name="">Edit</button></td>
                    </tr>
                    <tr>
                        <td>Work Phone</td>
                        <td></td>
                        <td><button type="button" name="">Edit</button></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td></td>
                        <td><button type="button" name="">Edit</button></td>
                    </tr>
                    <tr>
                        <td>Date of Birth</td>
                        <td></td>
                        <td><button type="button" name="">Edit</button></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Discard Changes"></td>
                        <td colspan="2"><input type="submit" value="Save Changes"></td>
                    </tr>
                </table>
            </div>
            <%@include file = "/WEB-INF/jspf/global/footer.jspf" %>
        </div>
    </body>
</html>
