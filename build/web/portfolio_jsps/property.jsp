
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Connection.ConnectionManager"%>
<!DOCTYPE html>
<%@page import="Client.ClientBean"%>
<html lang="en" dir="ltr">
    <head>
        <title>Property Portfolio</title>
        <meta charset="iso-8859-1">
        <link rel="stylesheet" href="../css/layout.css" type="text/css">
        <script src="../js/jquery-1.8.2.min.js"></script>
        <script src="../js/jquery-defaultvalue.js"></script>
        <script src="../js/jquery-browsercheck.js"></script>

        <script src="../js/tcal.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="../css/tcal.css"/>
        <link rel="stylesheet" href="../css/accordion_jquery-ui.css" />
        <script src="../js/accordion_jquery-1.9.1.js"></script>
        <script src="../js/accordion_jquery-ui.js"></script>

        <script type="text/javascript" src="../js/md5.js"></script>
        
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
            function validate()
            {
               var nameFormat=/^[a-zA-Z]+$/
                var noFormat=/^[0-9]+$/  
                 
                 if((document.frm.price.value.match(noFormat)==null))
                {
                    alert("Insert Correct price value.");
                    document.frm.price.focus();
                    return false;
            
                } 
                else if((document.frm.latest_price.value.match(noFormat)==null))
                {
                    alert("Insert Correct price value.");
                    document.frm.latest_price.focus();
                    return false;
            
                }
                 else if((document.frm.date.value==""))
                {
                    alert("Insert purchase date");
                    document.frm.date.focus();
                    return false;
                }
                else if((document.frm.location.value.match(nameFormat)==null))
                {
                    alert("Insert correct location");
                    document.frm.location.focus();
                    return false;
                }
                 else if( (document.frm.quantity.value.match(noFormat)==null))
                {
                    alert("Insert Correct quantity");
                    document.frm.quantity.focus();
                    return false;
                }   
                else{
                    document.frm.submit();
                }
                
            }
        </script>

        <script>
            $(function() {
                $( "#accordion" ).accordion({ 
                    collapsible: true, 
                    autoHeight: false, 
                    active: false,
                    heightStyle:"content"
                });
            });
        </script>
        <!-- / homepage scripts -->
    </head>
    <body>
        <%	String cuid;
            java.sql.Connection con;
            java.sql.Statement s;
            java.sql.ResultSet rs;

            ClientBean client = (ClientBean) session.getAttribute("Client");

            //   session.setAttribute("clienttmp", client);
            if (client == null) {
        %>
        Your session is Expired..Please <a href="../pages/index.jsp">Login</a>
        <%                } else {
            cuid = client.getUid();
            System.out.println("Client id is : " + cuid);
        %>
        <div class="wrapper row1">
            <header id="header" class="clear">
                <hgroup>
                    <h1><a href="#"><img src="../images/logo.png"/></a></h1>
                    <img src="../images/description.gif"/>
                </hgroup>
                <form>Welcome, <h2> <%=cuid%> </h2>(<a href="/Major_Project/ClientLogoutServlet">Log Out</a>)</form>
            </header>
        </div>
        <div class="wrapper row2">
            <nav id="topnav">
                <ul class="clear">
                    <li><a href="/Major_Project/pages/client_home.jsp">Home</a></li>
                    <li class="active"><a href="#">My Portfolio</a>
                        <ul>
                            <li><a href="stock.jsp">Stock</a></li>
                            <li><a href="mutual_fund.jsp">Mutual Funds</a></li>
                            <li><a href="bullion.jsp">Bullion</a></li>
                            <li><a href="loan.jsp">Loan</a></li>
                            <li><a href="property.jsp">Property</a></li>
                        </ul>
                    </li>
                    <li><a href="/Major_Project/pages/services_1.jsp">SERVICES</a></li>
                    <li><a href="/Major_Project/pages/contactus.jsp">CONTACT US</a></li>
                    <li><a href="/Major_Project/pages/aboutus_1.jsp">ABOUT US</a></li>
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
            <%
                 con = null;
        s = null;

        rs = null;
        con = ConnectionManager.getConnection();
        s = con.createStatement();
        String q = "select * from property_info where uid='"+cuid+"'";
        rs = s.executeQuery(q);
    %>
    <div id="accordion">
        <h3>Add Property</h3>
        <div>
            <form name="frm" action="/Major_Project/AddPropertyServlet" method="get" onsubmit="return validate();">
                <table>
                    <th>Property Type</th>
                    <th>Location</th>
                    <th>Purchase Price</th>
                    <th>Purchase Date</th>
                    <th>Latest Value</th>
                    
                    <tr>
                        <td>
                <select name="prop_name">
                    <option value="Land">Land</option>
                    <option value="Residential">Residential</option>
                    <option value="Commercial">Commercial</option>
                </select></td>
                        
                <td><input required type="text" name="location" /></td>
                <td><input required type="text" name="price"  /></td>
                <td><input required type="text" class="tcal" name="date" /></td>
                
                
                <td><input required type="text" name="latest_price" /></td>
                <td><input type="submit" value="Add" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></input></td>
                </tr>
                </table>
                <input type="hidden" value="<%=cuid%>" name="uid"/>
            </form>
        </div>

             <% 
                 if(!rs.next()){
                     %>
                     <br/>
                 No Property has been purchased.
                 <%
                 }
                                 else{%>
        <h3>Edit Property</h3>
        <div>

            <form method="post" name="form1" action="../portfolio_jsps/updateproperty.jsp">
            <table>
                <th>Property Type</th>
                <th>Location</th>
                <th>Date</th>
                <th>Investment Price</th>
                <th>Latest Price</th>
                <th>Delete</th>

                <%rs.beforeFirst();
                while (rs.next()) {%>
                <tr>
                    <td><input required type="text" name="prop_name" value="<%= rs.getString("prop_name")%>" /></td>
                    <td><input required type="text" name="location" value="<%= rs.getString("location")%>" onclick="this.value=''"/></td>
                    <td><input required type="text" class="tcal" name="date" value="<%= rs.getString("date")%>" onclick="this.value=''"/></td>
                    <td><input required type="text" name="price" value="<%= rs.getString("price")%>" onclick="this.value=''"/></td>
                    <td><input required type="text" name="latest_price" value="<%= rs.getString("latest_price")%>" onclick="this.value=''"/></td>
                     <td><input type="checkbox" name="delete" value="<%= rs.getString("fixedassest_id")%>"/></td>
                     <input type="hidden" name="fixedassest_id" value="<%= rs.getString("fixedassest_id")%>" />
                </tr>
                <%
                    }
                %>
            </table>
             <input type="submit" name="update" value="Save Changes" style="background-color:#49743D;font-weight:bold;color:#ffffff;"/>
              </form>
        </div>
<% } %>
    </div>
    <br /><br/>
    
    <%rs.beforeFirst();
            if(rs.next()){ %>
     <table border="1" cellpadding="8" cellspacing="6">

            <% rs.beforeFirst();
            float t_ip=0;
            float t_lp=0;
            float inv_pri=0;
            float lat_pri=0;
            while(rs.next())
                               {
                 inv_pri=Float.parseFloat(rs.getString("price"));
                 lat_pri=Float.parseFloat(rs.getString("latest_price"));
                
                 t_ip=t_ip+inv_pri;
                 t_lp=t_lp+lat_pri;
                 System.out.println("t_ip----"+t_ip);
            } %>
            
                <th>Investement Price</th >
                <th>Latest Value</th>
                <tr>
                <td><%= String.valueOf(t_ip)%></td>
                <td><%= String.valueOf(t_lp)%></td>
            </tr>  
        </table>
    <br /><br/>
    <table border="1" cellpadding="8" cellspacing="6">
        
        <th>Property Type</th>
        <th>Location</th>
        <th>Purchase Price</th>
        <th>Purchase Date</th>
        <th>Latest Value</th>


        <%rs.beforeFirst();
     while (rs.next()) {%>
        <tr>
            <td><%= rs.getString("prop_name")%></td>
            
            <td><%= rs.getString("location")%></td>
            <td><%= rs.getString("price")%></td>
            <td><%= rs.getString("date")%></td>
            <td><%= rs.getString("latest_price")%> </td>
          
        </tr>
        <%
            }
        %>
    </table>
    <% } %>
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