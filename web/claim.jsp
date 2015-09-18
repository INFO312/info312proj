<%-- 
    Document   : claim
    Created on : Sep 11, 2015, 11:45:13 AM
    Author     : csutton
--%>
<%@page import="resources.Util"%>
<%@page import="domain.Person"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <jsp:include page="/WEB-INF/jspf/global-include.jspf" />
        <link href="/PostGradSystem/css/claim.css" rel="stylesheet" type="text/css" />
        <title>Claim Your Account - FNAME LNAME</title>
    </head>
    <body>
        <div id ="container">
            <jsp:include page="/WEB-INF/jspf/global/header.jspf" flush="true">
                <jsp:param name="name" value="FNAMAE LNAME" />
            </jsp:include>
            <jsp:include page="/WEB-INF/jspf/sidebar/empty.jspf" flush="true" />
            
            <div id="main_content_area">
                
                <div class="tooltip">
                    <p>You have been invited to claim a profile for the University of Otago's Department of Informations Science's PostGraduate application portal.</p>
                    <p>This profile has been created by the Post Graduate Co-ordinator to allow you to complete an application for postgraduate study within the department. The Co-ordinator has completed the parts of the profile where able. You are now required to complete the missing sections of your profile and are encouraged to apply for study in one or more postgraduate courses.</p>
                </div>

                <button type='button' name='claimPERSONID' class="yellowButton claimButton">Claim Your Profile and Begin Your Application</button>
                <p class="noClaim"><a href="">I do not want to claim this profile</a></p>
                
            </div>
            <%@include file = "/WEB-INF/jspf/global/footer.jspf" %>
        </div>
    </body>
</html>
