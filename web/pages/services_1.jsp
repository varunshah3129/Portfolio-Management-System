
<!DOCTYPE html>
<%@page import="Client.ClientBean"%>
<html lang="en" dir="ltr">
<head>
<title>Welcome to MyPortfolio</title>
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
            <li><a href="../portfolio_jsps/property.jsp">Property</a></li>
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
<div class="wrapper row3">
  <div id="container" class="clear">
    <!-- content body -->
    
    <div id="content">
      
      <section>
        <script src="//www.gmodules.com/ig/ifr?url=http://hosting.gmodules.com/ig/gadgets/file/102891932573414116126/Market-Ticker.xml&amp;synd=open&amp;w=600&amp;h=46&amp;title=Sensex+Ticker&amp;border=%23ffffff%7C3px%2C1px+solid+%23999999&amp;output=js"></script>
        <br/>
      </section>
        
        <section>
        
         <jsp:include page="accordion.html"/>
        
        
      </section>
      
      
      
    </div>
    <!-- right column -->
    <aside id="right_column">
      
      <h2>Current Market</h2>
      <section>
           <script type="text/javascript">var _mcq=["6",""];</script><span id='_mc_mg6'></span><script language="JavaScript" src="http://stat1.moneycontrol.com/mcjs/common/mc_widget.js"></script><noscript><a href="http://www.moneycontrol.com">Sensex/Nifty</a></noscript>
      </section>
      <!-- /nav -->
      <section>
        <h2>Market News</h2>
        <script type="text/javascript" src="http://cdn.widgetserver.com/syndication/subscriber/InsertWidget.js"></script><script type="text/javascript">if (WIDGETBOX) WIDGETBOX.renderWidget('0018136f-5675-4544-9224-3c724730de7d');</script>
        
      </section>
    </aside>
  </div>
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