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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
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
        <link href="/_sass/style.css" type="text/css" rel="stylesheet">
        <link href="formstyle.css" type ="text/css" rel="stylesheet">
        <link href="style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    </head>

    <body>
        <div id="container">
            <%@include file = "/WEB-INF/jspf/header.jspf" %>
            <%@include file = "/WEB-INF/jspf/sidebar_withNavigation.jspf" %>
            
            
            <!-- All Content should be put in here! -->
            <div id="main_content_area">
                <p><%=message%></p>
                <p> Placeholder 1</p>
                <p> Placeholder 2 </p>
            </div>
            
             <%@include file = "/WEB-INF/jspf/footer.jspf" %>
        </div


        <div class="center-wrapper">

        </div>    
    </body>
</html>
