<!-- display the message to the user --> 
<p id="login-blurb">This portal allows you to <b>apply for</b> and <b>manage applications</b> for post-graduate study with the Information Science Department of the University of Otago.</p>

<ul id="login-tabs">
    <li>Login</li><li class="login-inactive-tab">Register</li><!-- No new line as new line char means width: 50% doesnt work -->
</ul>

<div id="login">

    <!-- YOU MUST USE THE FORM ACTIONS AND TYPE/NAME VALUES FOR THE INPUT FORMS AS SPECIFIED BELOW,
    IF YOU CHANGE THE LAYOUT, OR ELSE THE LoginServlet WILL NOT WORK -->
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

<footer id="login-footer">
    <nav>
        <ul>
            <li><a href="/help">Help</a></li>
            <li><a href="/contact">Contact</a></li>
            <li><a href="http://infosci.otago.ac.nz">Information Science Otago</a></li>
        </ul>
    </nav>
</footer>







<h2 class="sitspagetitle" id="sitspagetitle">
    Login to University of Otago eVision portal
</h2>

<fieldset class="loginFormFieldset">
    <legend>Portal Login</legend>
    <form>
        <label for="username"><b>Username: </b>

        </label>
        <input type="text" name="username" id="password" />
        <br>
        <br>
        <label for="password"><b>Password: </b> 
        </label>
        <input type="password" name="password" id="password" />
        <input type="submit" class='button' value="Login"/>
    </form>
</fieldset>

https://jsfiddle.net/8rafe394/
/*media all*/
 h2 {
    font-size: 26px;
    line-height: 28px;
    padding: 0;
    margin: 14px 0 14px 0;
    border-bottom: 1px solid #e8e8e8;
    font-family:"Minion Pro", Georgia, serif;
}
.loginFormFieldset {
    padding:25px 0px 25px 0px;
}
.loginFormFieldset legend {
    font-size:18px;
    margin-left:15px;
}
.loginFormFieldset input[type=text] {
    margin-top: 5px;
    margin-bottom: 5px;
    display:inline-block;
    *display: inline;
    /* for IE7*/
    zoom:1;
    /* for IE7*/
    vertical-align:middle;
    margin-left:20px;
    width:250px;
}
.loginFormFieldset label {
    font: 13px Helvetica, Arial, Geneva, sans-serif;
    display:inline-block;
    *display: inline;
    /* for IE7*/
    zoom:1;
    /* for IE7*/
    float: left;
    padding-top: 5px;
    text-align: right;
    width: 140px;
}

.button {
   border: 2px solid #a37a00;
   background: #e6ad00;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffcc23), to(#e6ad00));
   background: -webkit-linear-gradient(top, #ffcc23, #e6ad00);
   background: -moz-linear-gradient(top, #ffcc23, #e6ad00);
   background: -ms-linear-gradient(top, #ffcc23, #e6ad00);
   background: -o-linear-gradient(top, #ffcc23, #e6ad00);
   background-image: -ms-linear-gradient(top, #ffcc23 0%, #e6ad00 100%);
  
   -webkit-border-radius: 14px;
   -moz-border-radius: 14px;
   border-radius: 14px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #ffffff 0 1px 0;
   color: #000000;
   font-size: 14px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
    cursor:pointer;
   border: 2px solid #a37a00;
   text-shadow: #ffffff 0 1px 0;
   background: #ffcc23;
   background: -webkit-gradient(linear, left top, left bottom, from(#e6ad00), to(#ffcc23));
   background: -webkit-linear-gradient(top, #e6ad00, #ffcc23);
   background: -moz-linear-gradient(top, #e6ad00, #ffcc23);
   background: -ms-linear-gradient(top, #e6ad00, #ffcc23);
   background: -o-linear-gradient(top, #e6ad00, #ffcc23);
   background-image: -ms-linear-gradient(top, #e6ad00 0%, #ffcc23 100%);
   color: #000000;
   }
