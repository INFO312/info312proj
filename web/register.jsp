<%-- 
    Document   : index
    Created on : Aug 7, 2015, 2:59:07 PM
    Author     : Kadin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String message = "";
    Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
    if (statusCode != null && statusCode == HttpServletResponse.SC_BAD_REQUEST) {
        message = request.getAttribute("javax.servlet.error.message").toString();
    }
    if (statusCode != null
            && statusCode == HttpServletResponse.SC_UNAUTHORIZED) {
        //Login to continue
        message = request.getAttribute("javax.servlet.error.message").toString();
    }
    String userType = (String) session.getAttribute("userType");
    if (userType != null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
    String regfail = (String) session.getAttribute("registrationMsg");
    if (regfail != null) {
        message = regfail;
        session.removeAttribute("registrationMsg");
    }
%>
<!DOCTYPE HTML>

<html>
    <head>
        <title>Home - Graduate Application Portal</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%@include file = "/WEB-INF/jspf/global-include.jspf" %>
        <link href="/PostGradSystem/css/admin/form.css" type="text/css" rel="stylesheet">
        <script src="/PostGradSystem/scripts/datePicker.js"></script>

    </head>

    <body>
        <div id="container">
            <%@include file = "/WEB-INF/jspf/global/header.jspf" %>
            <%@include file = "/WEB-INF/jspf/sidebar/empty.jspf" %>

            <!--!!! All Content should be put in here !!! -->
            <div id="main_content_area">
                <p class ="sessionMessage"><%=message%></p>

                <div class="registerFormDiv">

                    <h2>
                       Registration
                    </h2>
                    <br>
                    <p class="genericText">Welcome to the Registration page. Please enter your details below to register.</p>
                    <fieldset class="registerFormFieldset">
                        <legend> Details</legend>
                        <form id="register-form" action="/PostGradSystem/RegisterServlet" method="post" class="form-green">
                            <label for="email">
                                <span>Email: </span>
                                <input type="text" name="email">
                            </label>
                            <label for="password">
                                <span>Password: </span>
                                <input type="password" name="password">
                            </label>
                            <hr>
                            <label for="title">
                                <span>Title: </span>
                                <input type="text" name="title">
                            </label>
                            <label for="fname">
                                <span>First Name: </span>
                                <input type="text" name="fname">
                            </label>
                            <label for="mname">
                                <span>Middle Name: </span>
                                <input type="text" name="mname">
                            </label>
                            <label for="lname">
                                <span>Last Name: </span>
                                <input type="text" name="lname">
                            </label>
                            <label for="address">
                                <span>Address: </span>
                                <input type="text" name="address">
                            </label>
                            <br>
                            <hr>
                            <br>
                            <label for="hphone">
                                <span>Home Phone: </span>
                                <input type="text" name="hphone">
                            </label>
                            <label for="mphone">
                                <span>Mobile Phone: </span>
                                <input type="text" name="mphone">
                            </label>
                            <label for="wphone">
                                <span>Work Phone: </span>
                                <input type="text" name="wphone">
                            </label>
                            <label for="gender">
                                <span>Gender: </span>
                                <select name="gender">
                                    <option value="m">Male</option>
                                    <option value="f">Female</option>
                                </select>
                            </label>
                            <label for ="dob">
                                <span>Date of Birth: (Day/Month/Year)</span>
                                <input type="text" id="datepicker" name="dob">
                            </label>


                            <label>
                                <span>&nbsp;</span> 
                                <input type="submit" value="Register" class="yellowButton">
                            </label>

                        </form>
                    </fieldset>
                </div>
            </div>

            <%@include file = "/WEB-INF/jspf/global/footer.jspf" %>
        </div>

    </body>
</html>
