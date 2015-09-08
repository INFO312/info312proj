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
        <title>Login - Information Science Otago</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%@include file = "/WEB-INF/jspf/script_style_include.jspf" %>
    </head>

    <body>
        <div id="container">
            <%@include file = "/WEB-INF/jspf/global/header.jspf" %>
            <%@include file = "/WEB-INF/jspf/sidebar/sidebar_empty.jspf" %>

            <!-- All Content should be put in here! -->
            <div id="main_content_area">
                <p class="sessionMessage"><%=message%></p>
                <p class="genericText"> 
                    The Graduate Application Portal allows users to apply for Post-Graduate level study within the department of Information Science at the University of Otago.
                </p>
                <p class="genericText"> 
                    Here you can apply for study, connect with department members, and make enquiries.    
                </p>
                <p class="genericText">
                    If you haven't accessed the Graduate Application Portal previously you will need to <a href="/PostGradSystem/register.jsp">Register</a>.
                </p>
                <p class="genericText">
                    Note: For returning Otago Students: You cannot use your University username and password. You must use your GAP account.
                </p>

                <!-- YOU MUST USE THE FORM ACTIONS AND TYPE/NAME VALUES FOR THE INPUT FORMS AS SPECIFIED BELOW,
                IF YOU CHANGE THE LAYOUT, OR ELSE THE LoginServlet WILL NOT WORK -->
                <%@include file = "/WEB-INF/jspf/login/loginForm.jspf" %>
                
            </div>

            <%@include file = "/WEB-INF/jspf/global/footer.jspf" %>
        </div>
 
    </body>
</html>
