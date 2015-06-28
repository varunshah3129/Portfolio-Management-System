<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <title>Forgot Your Password?</title>
        <meta charset="iso-8859-1">
        <link rel="stylesheet" href="../css/layout.css" type="text/css">
        <script src="../js/jquery-1.8.2.min.js"></script>
        <script src="../js/jquery-defaultvalue.js"></script>
        <script src="../js/jquery-browsercheck.js"></script>

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

            ddsmoothmenu.init({
                mainmenuid: "templatemo_menu", //menu DIV id
                orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
                classname: 'ddsmoothmenu', //class added to menu's outer DIV
                //customtheme: ["#1c5a80", "#18374a"],
                contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
            })

        </script>
        <script src="../js/md5.js" type="text/javascript"></script>

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
                    <li><a href="../pages/services_1.jsp">SERVICES</a></li>
                    <li><a href="../pages/contactus.jsp">CONTACT US</a></li>
                    <li><a href="../pages/aboutus_1.jsp">ABOUT US</a></li>

                </ul>
            </nav>
        </div>
        <!-- content -->
        <div class="jspcontents">
            
            <%
                int len = 8;
                char[] pwd = new char[len];
                int c = 'A';
                int rand = 0;
                for (int i = 0; i < 8; i++) {
                    rand = (int) (Math.random() * 3);
                    switch (rand) {
                        case 0:
                            c = '0' + (int) (Math.random() * 10);
                            break;
                        case 1:
                            c = 'a' + (int) (Math.random() * 26);
                            break;
                        case 2:
                            c = 'A' + (int) (Math.random() * 26);
                            break;
                    }
                    pwd[i] = (char) c;
                }
                String pass = new String(pwd);

            %>
            <form name="frm" method="post" action="/Major_Project/ForgotPswdServlet" style="padding-left: 40px">
                Registered Email:
                <input type="email" name="email" required/>

                <input type="submit" value="Submit" onclick="passmd5.value = calcMD5(passmd5.value);"/>
                <input type="hidden" name="passjava" value="<%=pass%>"/>
                <input type="hidden" name="passmd5" value="<%=pass%>"/>

            </form>
                <br/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     We will send a new password to your email address.

        </div>

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