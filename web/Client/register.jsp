<%-- 
    Document   : register
    Created on : May 31, 2015, 1:56:14 PM
    Author     : varun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <title>My Portfolio Registration</title>
        <meta charset="iso-8859-1">
        <link rel="stylesheet" href="../css/layout.css" type="text/css">
        <script src="../js/jquery-1.8.2.min.js"></script>
        <script src="../js/jquery-defaultvalue.js"></script>
        <script src="../js/jquery-browsercheck.js"></script>

        <link rel="stylesheet" type="text/css" href="../css/tcal.css" media="all"/>
        <script src="../js/tcal.js" type="text/javascript"></script>
        <script  src = "../js/countries.js" type= "text/javascript"></script>
        <link type="text/css" href="../css/password_strength.css" rel="stylesheet" />
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/mocha.js"></script>

        <script type="text/javascript" src="../js/md5.js"></script>

        <script src="../js/jquery-innerfade.js"></script>
        <script>
            $(function () {
                $('#rotate').innerfade({
                    animationtype: 'fade',
                    speed: 750,
                    timeout: 5000,
                    type: 'sequence',
                    containerheight: 'auto'
                });
            });
        </script>
        <script type="text/javascript">
            function validate()
            {
                var nameFormat=/^[a-zA-Z]+$/
                var noFormat=/^[0-9]+$/
                var pattern = /^[a-z0-9_\+-]+(\.[a-z0-9_\+-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.([a-z]{2,4})$/; 
        
      
                if((document.frm.fname.value.match(nameFormat)==null)||(document.frm.fname.value.match(nameFormat)==""))
                {
                    alert("Insert Correct name");
                    document.frm.fname.focus();
                    return false;
                }
                if((document.frm.lname.value.match(nameFormat)==null)||(document.frm.lname.value.match(nameFormat)==""))
                {
                    alert("Insert Correct name");
                    document.frm.lname.focus();
                    return false;
                }    
                if((document.frm.email.value.match(pattern)==null)||(document.frm.email.value.match(pattern)==""))
                {
                    alert("Insert Correct E-mail address");
                    document.frm.lname.focus();
                    return false;
            
                } 
                if((document.frm.password.value.match(cpassword)==null)||(document.frm.password.value.match(cpassword)==""))
                {
                    alert("Passwords do not match");
                    document.frm.cpassword.focus();
                    return false;
            
                }
                
                if((document.frm.fname.length)>15)
                {
                    alert("Insert Correct name");
                    document.frm.fname.focus();
                    return false;
                }
    
                if((document.frm.lname.length)>15)
                {
                    alert("Insert Correct name");
                    document.frm.lname.focus();
                    return false;
                }
                else
                {
                    document.frm.submit();
                }
    
            }   
        </script>
        <style>
            label#compul::after{
                content: '*';
                color: red;
                font-weight: bold;} 
            </style>

            <!-- MD5 -->
            <script type="text/javascript">
                function check(value){ 
                    xmlHttp=GetXmlHttpObject()
                    var url="checkajax.jsp";
                    url=url+"?uid="+value;
                    xmlHttp.onreadystatechange=stateChanged 
                    xmlHttp.open("GET",url,true)
                    xmlHttp.send(null)
                }
                function stateChanged(){ 
                    if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
                        var showdata = xmlHttp.responseText; 
                        document.getElementById("mydiv").innerHTML= showdata;
                    } 
                }
                function GetXmlHttpObject(){
                    var xmlHttp=null;
                    try{
                        xmlHttp=new XMLHttpRequest();
                    }
                    catch (e) {
                        try {
                            xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
                        }
                        catch (e){
                            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                        }
                    }
                    return xmlHttp;
                }
            </script>
            <!-- MD5 ends -->
            <!-- / homepage scripts -->
        </head>
        <body>
            <div class="wrapper row1">
            <header id="header" class="clear">
                <hgroup>
                    <h1><a href="#"><img src="../images/logo.png"/></a></h1>
                    <img src="../images/description.gif"/>
                </hgroup>
                <form method="post" action="/Major_Project/ClientLoginServlet">
                    <fieldset>

                        <input type="text" name="username"  value="Userid" onclick="this.value = ''" class="uimage">

                        <input type="password" name="password"  value="Password" onclick="this.value = ''" class="pimage">
                        </br>
                        <input type="submit" id="sf_submit" value="Login" onclick="password.value=calcMD5(password.value);">
                        </br>
                        <a href="registration.html">Not a Member Yet?</a>
                        &nbsp;&nbsp;
                        <a href="ForgotPswd.jsp">Forgot Password?</a>
                    </fieldset>
                </form>

            </header>
        </div>
        <div class="wrapper row2">
            <nav id="topnav">
                <ul class="clear">
                    <li class="active"><a href="../pages/index.jsp">Home</a></li>
                    <li><a href="../pages/services.jsp">SERVICES</a></li>
                    <li><a href="../pages/contactus.html">CONTACT US</a></li>
                    <li><a href="../pages/aboutus.html">ABOUT US</a></li>

                </ul>
            </nav>
        </div>
        <!-- content -->
        <div class="jspcontents">
        <form name="frm" method="post" action="/Major_Project/ClientRegistrationServlet" onsubmit="return checkform(this);return validate();">
            <table>		
                <tr>
                    <td width="1">&nbsp;</td>
                    <td width="101"><label id="compul">First Name</label></td>
                    <td width="279"><input type="text" name="fname" required placeholder="First Name"/>    </td>
                </tr>

                <tr>
                    <td>&nbsp;</td>
                    <td><span><label id="compul">Last Name</label></span></td>
                    <td><input type="text" name="lname" required placeholder="Last Name"/>    </td>
                </tr>

                <tr>
                    <td>&nbsp;</td>
                    <td><span><label id="compul">Login Name</label></span></td>
                    <td><input type="text" id="uid" name="uid" required placeholder="Username" onkeyup="check(this.value);"/><font color="red" size="2" style="font-weight: bold"><div id="mydiv"></div></font>    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><span><label id="compul">Password</label></span></td>
                    <td><input name="password" type="password" id="password" required placeholder="Password"/>
                        <div id="complexity" class="default" style="width: 165px;height: 5px"></div>
                    </td> 
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><label id="compul">Password Confirm</label></td>
                    <td><input type="password" name="cpassword" required placeholder="Retype Password"/>
                    </td>
                </tr>
                <tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><span>Birth Date</span></td>
                    <td><input type="text" name="dob" class="tcal" placeholder="Birth Date"/>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><label id="compul">Email</label></td>
                    <td><input type="email" name="email" required placeholder="Email Address"/></td>
                </tr>		
                <tr>
                    <td>&nbsp;</td>
                    <td><label id="compul">Contact No</label></td>
                    <td><input type="text" name="mno" required placeholder="Mobile No."/></td>
                </tr>	
                <tr>	
                    <td>&nbsp;</td>
                    <td><label id="compul">Gender</label></td>
                    <td>
                        <select class="element text medium" name="gender" id="gender">
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>Select Occupation</td>
                    <td>    
                        <select name="occupation" id="occupation" >
                            <option value="Business">Business</option>
                            <option value="Service">Service</option>
                            <option value="Govt Employee">Govt Employee</option>
                            <option value="Professional">Professional</option>
                            <option value="Homemaker">Homemaker</option>
                            <option value="Student">Student</option>
                            <option value="Retired">Retired</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>&nbsp;</td>
                    <td><span class="description">Select Country</span></td>
                    <td>
                        <select onchange="print_state('state',this.selectedIndex);" id="country" name = "country" ></select>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><span class="description">Select State</span></td>
                    <td>
                        <select name ="state" id = "state"></select>
                        <script> language="javascript"<print_country("country");
                        </script>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><label>City</label></td>
                    <td><input type="text"  name="city" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td> <label for="code" style="float:left; clear:both"><label id="compul">Write code below :</label> <span id="txtCaptchaDiv" style="color:#F00"></span><!-- this is where the script will place the generated code --> 
                            <input type="hidden" id="txtCaptcha" /></label><!-- this is where the script will place a copy of the code for validation: this is a hidden field --></td>
                    <td> <input type="text" name="txtInput" id="txtInput" size="30" style="float:left; clear:both" /> </td>
                </tr>
                <tr>
                    <td height="11" colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="3"><div align="center">
                            <input name="submit" type="submit" value="Submit" onclick="password.value=calcMD5(password.value);cpassword.value=calcMD5(cpassword.value);"/>
                            <label>
                                <input type="reset" name="reset"  value="Clear" />
                            </label>
                        </div></td>
                </tr>

            </table>
        </form>
            </div>
        <script type="text/javascript">
            //Generates the captcha function    
            var a = Math.ceil(Math.random() * 9)+ '';
            var b = Math.ceil(Math.random() * 9)+ '';       
            var c = Math.ceil(Math.random() * 9)+ '';  
            var d = Math.ceil(Math.random() * 9)+ '';  
            var e = Math.ceil(Math.random() * 9)+ '';  

            var code = a + b + c + d + e;
            document.getElementById("txtCaptcha").value = code;
            document.getElementById("txtCaptchaDiv").innerHTML = code;  
        </script>

        <script type="text/javascript">
            function checkform(theform){
                var why = "";

                if(theform.txtInput.value == ""){
                    why += "- Security code should not be empty.\n";
                }
                if(theform.txtInput.value != ""){
                    if(ValidCaptcha(theform.txtInput.value) == false){
                        why += "- Security code did not match.\n";
                    }
                }
                if(why != ""){
                    alert(why);
                    return false;
                }
            }

            // Validate the Entered input aganist the generated security code function   
            function ValidCaptcha(){
                var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
                var str2 = removeSpaces(document.getElementById('txtInput').value);
                if (str1 == str2){
                    return true;    
                }else{
                    return false;
                }
            }

            // Remove the spaces from the entered and generated code
            function removeSpaces(string){
                return string.split(' ').join('');
            }
        </script>
        <!-- Footer -->
        <div class="wrapper row4">
            <div id="footer" class="clear">
                <!-- Section One -->
                <section class="one_quarter first">
                 <h2 class="title">Contact Details</h2>
      
    Varun Shah<br>
     Payal Gandhi <br>
      
      <p>Mo: 9016099269<br>
        Fax: xxxxx xxxxxxxxxx<br>
        Email: <a href="#">Vshah22@horizon.csueastbay.edu</a></p>
    </section>
    <!-- Section Two -->
    <section class="one_quarter">
      <h2 class="title">Quick Links</h2>
      <nav>
        <ul>
          <li class="first"><a href="http://www.moneycontrol.com/news/">News</a></li>
          <li><a href="http://www.moneycontrol.com/terminal/">Live Sensex</a></li>
          <li><a href="http://www.moneycontrol.com/commodity/">Commodities Prices</a></li>
          <li><a href="http://www.moneycontrol.com/fixed-income/small-savings-schemes/">Small Savings Schemes</a></li>
        </ul>
      </nav>
    </section>
    <!-- Section Three -->
      <section class="one_quarter">
      <h2 class="title">Suggestions From Blogs</h2>
      <nav>
        <ul>
          <li class="first"><a href="http://the-finance-blog.blogspot.in/">The Finance Blog</a></li>
          <li><a href="http://bigfatfinanceblog.com/">Big Fat Finance Blog</a></li>
          <li><a href="http://in.finance.yahoo.com/blogs/economaniac/">Yahoo Finance Blog</a></li>
          <li><a href="http://googlefinanceblog.blogspot.in/">Google Finance Blog</a></li>
        </ul>
      </nav>
    </section>
    <!-- Section Four -->
    <section class="one_quarter">
      <h2 class="title">Grab Our Newsletter</h2>
      <form method="post" action="#">
        <fieldset>
          <legend>Contact Form:</legend>
          <label for="nl_name">Name:</label>
          <input type="text" name="nl_name" value="Name" id="nl_name" onclick="this.value=''">
          <label for="nl_email">Email:</label>
          <input type="text" name="nl_email" id="nl_email" value="Email" onclick="this.value=''">
          <button type="submit" value="submit">Submit</button>
        </fieldset>
      </form>
    </section>
    <!-- / Section -->
  </div>
</div>
<!-- Copyright -->
<div class="wrapper row5">
  <footer id="copyright" class="clear">
    <p class="fl_left">Copyright &copy; 2015 - All Rights Reserved</p>
    <p class="fl_right">Designed by Varun Shah &AMP; Payal Gandhi</p>
  </footer>
</div>
<script>
$(document).ready(function () {
    $("#nl_name, #nl_email").defaultvalue("Name", "Email Address");
});
</script>
<% } %>
</body>
</html>