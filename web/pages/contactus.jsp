
<!DOCTYPE html>
<%@page import="Client.ClientBean"%>
<html lang="en" dir="ltr">
<head>
<title>Contact Us</title>
<meta charset="iso-8859-1">
<link rel="stylesheet" href="../css/layout.css" type="text/css">
<script src="../js/jquery-1.8.2.min.js"></script>
<script src="../js/jquery-defaultvalue.js"></script>
<script src="../js/jquery-browsercheck.js"></script>
    
<script type="text/javascript" src="../js/md5.js"></script>
<!--[if lt IE 9]>
<link rel="stylesheet" href="styles/ie.css" type="text/css">
<script src="scripts/ie/html5shiv.min.js"></script>
<![endif]-->
<!-- homepage scripts -->
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
<!-- / homepage scripts -->
</head>
<body>
<%	String cuid;
                ClientBean client=(ClientBean) session.getAttribute("Client");
          
            //   session.setAttribute("clienttmp", client);
            if (client == null) {
                response.sendRedirect("index.jsp");
            } else {
               cuid = client.getUid();
                System.out.println("Client id is : " + cuid);
        %>
<div class="wrapper row1">
  <header id="header" class="clear">
    <hgroup>
      <h1><a href="/Major_Project/pages/client_home.jsp"><img src="../images/logo.png"/></a></h1>
      <img src="../images/description.gif"/>
    </hgroup>
      <form>Welcome, <h2> <%=cuid%> </h2>(<a href="/Major_Project/ClientLogoutServlet">Log Out</a>)</form>
  </header>
</div>
<div class="wrapper row2">
  <nav id="topnav">
    <ul class="clear">
      <li class="active"><a href="../pages/client_home.jsp">Home</a></li>
      <li><a href="#">My Portfolio</a>
        <ul>
            <li><a href="../portfolio_jsps/stock.jsp">Stock</a></li>
            <li><a href="../portfolio_jsps/mutual_fund.jsp">Mutual Funds</a></li>
            <li><a href="../portfolio_jsps/bullion.jsp">Bullion</a></li>
            <li><a href="../portfolio_jsps/loan.jsp">Loan</a></li>
            <li><a href="../portfolio_jsps//property.jsp">Property</a></li>
        </ul>
      </li>
      <li><a href="services_1.jsp">SERVICES</a></li>
      <li><a href="contactus.jsp">CONTACT US</a></li>
      <li><a href="aboutus_1.jsp">ABOUT US</a></li>
      <li><a href="#">My Account</a>
        <ul>
            <li><a href="../Client/edit.jsp">Edit My Profile</a></li>
            <li><a href="../Client/changepswd.jsp">Change Password</a></li>
            <li><a href="../Client/dreport.jsp">Download Report</a></li>
        </ul>
      </li>
      
    </ul>
  </nav>
</div>
<!-- content -->
<div class="jspcontents">
    <form name="contact" method="post" action="/Major_Project/ContactUs">
                    <table>
                        <tr>
                            <td><label>Name</label></td>
                            <td><input type="text" name="name"/></td>
                        </tr>
                        <tr>
                            <td><label>Subject</label></td>
                            <td><input type="text" name="subject"/></td>
                        </tr>
                        <tr>
                            <td><label>Email</label></td>
                            <td><input type="email" name="email"/></td>
                        </tr>
                        <tr>
                            <td><label>Message</label></td>
                            <td><textarea name="message" style="width: 200px; height: 100px"></textarea></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" name="submit" value="Submit"/></td>
                        </tr>
                    </table>
                </form>
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