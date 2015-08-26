<%-- 
    Document   : index
    Created on : Aug 7, 2015, 2:59:07 PM
    Author     : Kadin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
    <head>
        <title>Login - Information Science Otago</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--[if lt IE 9]>
            <script src="/scripts/html5shiv.js"></script>
        <![endif]-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="/_scripts/showhide.js"></script>
        <link href="/_sass/style.css" type="text/css" rel="stylesheet">
        <link href="formstyle.css" type ="text/css" rel="stylesheet">
    </head>

    <body>
        <%
            // get the status code to see why the log in page was requested           Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code"); 
            Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
            // default message to display to the user 
            String message = "Please log in to continue.";
         // if the status code was 401 (UNAUTHORIZED) then extract the message 
            // from the request 
            if (statusCode != null
                    && statusCode == HttpServletResponse.SC_UNAUTHORIZED) {
                message
                        = request.getAttribute("javax.servlet.error.message").toString();
            }
            if (statusCode != null && statusCode == HttpServletResponse.SC_BAD_REQUEST) {
                message = request.getAttribute("javax.servlet.error.message").toString();
            }

        %> 
        <br> 
        <p><%=message%></p><!-- display the message to the user --> 



        <img class="coat-of-arms" src="/resources/UoO - Coat of Arms.png">
        <h1>GAP</h1>
        <h2>Graduate Application Portal</h2>

        <div class="center-wrapper">

            <p id="login-blurb">This portal allows you to <b>apply for</b> and <b>manage applications</b> for post-graduate study with the Information Science Department of the University of Otago.</p>

            <ul id="login-tabs">
                <li>Login</li><li class="login-inactive-tab">Register</li><!-- No new line as new line char means width: 50% doesnt work -->
            </ul>

            <div id="login">
                
                <!-- YOU MUST USE THE FORM ACTIONS AND TYPE/NAME VALUES FOR THE INPUT FORMS AS SPECIFIED BELOW,
                FI YOU CHANGE THE LAYOUT, OR ELSE THE LoginServlet WILL NOT WORK -->
                <form id="login-form" action="/PostGradSystem/LoginServlet" method="post" class="form-green"> <!-- Action needs to be changed -->
                    <h1>Login</h1>
                    <label for="email">
                        <span>Email: </span>
                        <input type="text" name="username">
                    </label>
                    
                    <label for="password">
                        <span>Password: </span>
                        <input type="password" name="password">
                    </label>
                    
                    <label>
                        <select name="type">
                            <option value="staff">Staff</option>
                            <option value="student">Student</option>
                        </select>
                    </label>
                    <label>
                        <span>&nbsp;</span> 
                        <input type="button" class="button" value="Login">
                    </label>
                    <p><a href="#">Forgot Password</a></p>
                </form>
                <br>
                <br>
                <form id="register-form" action="/PostGradSystem/RegisterServlet" method="post" class ="form-green">
                    <h1> Register </h1>
                    <label for="username">
                        <span>Username: </span>
                        <input type="text" name="username">
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
                    <label for="email">
                        <span>Email: </span>
                        <input type="text" name="email">
                    </label>
                    <hr>
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
                        <select name="gender">
                            <option value="m">Male</option>
                            <option value="f">Female</option>
                        </select>
                    </label>
                    

                    <label>
                        <span>&nbsp;</span> 
                        <input type="submit" class="button" value="Register">
                    </label>
                </form>
            </div>

            <footer id="login-footer">
                <nav>
                    <ul>
                        <li><a href="/help">Help</a></li>
                        <li><a href="/contact">Contact</a></li>
                        <li><a href="http://infosci.otago.ac.nz">Information Science Otago</a></li>
                    </ul>
                </nav>
            </footer>

        </div>    
    </body>
</html>
