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
%>
<!DOCTYPE HTML>

<html>
    <head>
        <title>Home - Graduate Application Portal</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%@include file = "/WEB-INF/jspf/script_style_include.jspf" %>
        <script>
            $(function () {
                $("#datepicker").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd-mm-yy',
                    defaultDate: '01-01-1990'
                });
            });
        </script>
       
    </head>

    <body>
        <div id="container">
            <%@include file = "/WEB-INF/jspf/header.jspf" %>
            <%@include file = "/WEB-INF/jspf/sidebar_withNavigation.jspf" %>


            <!--!!! All Content should be put in here!!! -->
            <div id="main_content_area">
                <p><%=message%></p>
                <p> Placeholder 1</p>
                <p> Placeholder 2 </p>

                <form id="register-form" action="/PostGradSystem/RegisterServlet" method="post" class ="form-green">
                    <h1> Register </h1>
                    <label for="email">
                        <span>Email: </span>
                        <input type="text" name="email">
                    </label>
                    <label for="password">
                        <span>Password </span>
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
                        <input type="text" name="email">
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
                    </label


                    <label>
                        <span>&nbsp;</span> 
                        <input type="submit" class="button" value="Register">
                    </label>
                </form>

            </div>

            <%@include file = "/WEB-INF/jspf/footer.jspf" %>
        </div

    </body>
</html>
