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
             message = 
                     request.getAttribute("javax.servlet.error.message").toString(); 
          }if(statusCode != null && statusCode == HttpServletResponse.SC_BAD_REQUEST){ 
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
                <form id="login-form" action="/PostGradSystem/LoginServlet" method="post"> <!-- Action needs to be changed -->
                    <label for="email">Email: </label>
                    <input type="text" name="username">
                    <br>
                    <label for="password">Password: </label>
                    <input type="password" name="password">
                    <br><input type ="radio" name="type" value ="staff">Staff<br>
                    <input type ="radio" name="type" value="student">Student<br>
                    <br>
                    <input type="submit" value="Login">
                    <p><a href="#">Forgot Password</a></p>
                </form>

                 <form id="register-form" action="/PostGradSystem/RegisterServlet" method="post">
                     <label for="fname">First Name: </label>
                    <input type="text" name="fname">
                     <label for="lname">Last Name: </label>
                    <input type="text" name="email">
                    <label for="email">Email: </label>
                    <input type="text" name="email">
                    <br>
                    <label for="password">Password: </label>
                    <input type="password" name="password">
                    <br>
                    <input type="submit" value="Register">
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
