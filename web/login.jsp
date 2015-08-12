<%-- 
    Document   : login
    Created on : 08/13/2015, 4:25:36 PM
    Author     : Kadin Boyle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
   <head>
      
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <!-- Ommitted until css implemented. <link rel ="stylesheet" type ="text/css" href ="/shopping/style.css"> -->
      <title>Log in page</title>
   </head>
   
   <body>
      <!-- \\ include file = "/WEB-INF/jspf/nav.jspf"  -->
      <h1>Log in</h1>
      <p> Need a select student or staff module here...</p>
      <div id ="wrapper">
      <%
        // get the status code to see why the log in page was requested
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
      <h3><%=message%></h3><!-- display the message to the user -->
      <br><br>
      <form class ="formLogin" action="/PostGradSystem/LoginServlet" method="post">
         <fieldset>
            <br>
            <legend><strong>Login Details</strong></legend>
            <label>User Name:<input type="text" name="username"></label>
            <label>Password:<input type="password" name="password"></label>
            <br><input type ="radio" name="type" value ="staff">Staff<br>
            <input type ="radio" name="type" value="student">Student<br>
            <button type="submit">Login</button>
         </fieldset>
      </form>
      <br>
      <br>
      <br>
      <br>
      <ul>
      </ul>
      </div>
      <div id ="footer">
            <p>Post Graduate System</p>
      </div>
   </body>
</html>
