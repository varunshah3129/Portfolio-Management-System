<%@page import="Client.ClientBean"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>My Portfolio</title>
<meta charset="iso-8859-1">
<link rel="stylesheet" href="../css/layout.css" type="text/css">
<script src="../js/jquery-1.8.2.min.js"></script>
<script src="../js/jquery-defaultvalue.js"></script>
<script src="../js/jquery-browsercheck.js"></script>
    
<script type="text/javascript" src="../js/md5.js"></script>

<!-- homepage scripts -->
<script src="../js/jquery-innerfade.js"></script>

<!-- / homepage scripts -->
</head>
<body>
    <%	String cuid;
                ClientBean client=(ClientBean) session.getAttribute("Client");
          
            //   session.setAttribute("clienttmp", client);
            if (client != null) {
                response.sendRedirect("client_home.jsp");
            } else {
               
        %>
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
        <a href="../Client/registration.html">Not a Member Yet?</a>
        &nbsp;&nbsp;
        <a href="../Client/ForgotPswd.jsp">Forgot Password?</a>
      </fieldset>
    </form>
    
  </header>
</div>
<div class="wrapper row2">
  <nav id="topnav">
    <ul class="clear">
      <li class="active"><a href="index.jsp">Home</a></li>
      <li><a href="services.jsp">SERVICES</a></li>
      <li><a href="contactus.html">CONTACT US</a></li>
      <li ><a href="aboutus.jsp">ABOUT US</a></li>
         
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
        <a title='Gold Coin Prices' target='_blank' href='http://www.goldshark.com'><img alt='Gold Coin Prices' width='535' height='104' src='http://graphics.goldshark.com/values/wider.png' border='0' style='max-width:100% !important; margin:0;padding:0;'/></a>
      </section>
        <section>
        <figure class="imgr"><img src="../images/3.jpg" alt="" width="170" height="125"></figure>
        <p>Customise this portfolio and start tracking all your investments and assets including Stocks, Mutual Funds, ULIPs and Bullion, through live price updates.</p>
        <p>The system allows the clients to create multiple accounts in his single portfolio account. All the details filled by him help him in generating his return statement of after paying the text. He can also generate his profit and loss reports and thus can keep a check on the buying and selling of his holdings & securities. This will make him aware of his daily profits and losses so that we can access then and can take require decisions. </p>
        
        <figure class="imgl"><img src="../images/1.jpg" alt="" width="170" height="125"></figure>
        <p>When you sell or buy stock and you use a complicated spreadsheet program, it can take all day to edit your stock portfolio. Using a personal finance website program, however, makes it much easier. You can usually edit the stocks in your chart simply by pointing and clicking, which leaves you time to accomplish other tasks during the day.</p>
        
        
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