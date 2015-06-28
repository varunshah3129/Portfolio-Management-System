
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Connection.ConnectionManager"%>
<!DOCTYPE html>
<%@page import="Client.ClientBean"%>
<html lang="en" dir="ltr">
    <head>
        <title>Bullion Portfolio</title>
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
               
                var noFormat=/^[0-9]+$/  
                 
                 if((document.frm.price.value.match(noFormat)==null))
                {
                    alert("Insert Correct price value.");
                    document.frm.price.focus();
                    return false;
            
                } 
                 else if((document.frm.date.value==""))
                {
                    alert("Insert purchase date");
                    document.frm.date.focus();
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
                    <li><a href="/Major_Project/pages/services.jsp">SERVICES</a></li>
                    <li><a href="/Major_Project/pages/contactus.jsp">CONTACT US</a></li>
                    <li><a href="/Major_Project/pages/aboutus.jsp">ABOUT US</a></li>
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
                String q = "select * from bullion_info where uid='" + cuid + "'";
                rs = s.executeQuery(q);
            %>
            <div id="accordion">
                <h3>Add Bullion</h3> 
                <div> 
                    <form name="frm" action="/Major_Project/AddBullionServlet" method="get"  onsubmit="return validate();">
                        <table>
                            <th>Select Metal</th>
                            <th>Quantity (gms)</th>
                            <th>Purchase Price </th>
                            <th>Date</th>
                            <tr>
                                <td>
                                    <select required name="commodity_name" id="metal">
                                        <option value="Gold" selected="selected">Gold</option>
                                        <option value="Silver">Silver</option>
                                    </select></td>

                                <td>
                                    <input required type="text" name="quantity" />
                                </td>
                                <td>
                                    <input required type="text" name="price" />
                                </td> 
                                <td>
                                    <input required type="text" class="tcal" name="date"/>
                                </td>

                                <td><input type="submit" value="Add" style="background-color:#49743D;font-weight:bold;color:#ffffff;"/></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td></td>
                                <td><p style="font-size: 10px">Gold Rs. Per 10 gms,Silver Rs. Per 1 Kg</p></td>
                                <td></td>
                                <td></td>
                            </tr>

                        </table>
                        <input type="hidden" value="<%=cuid%>" name="uid"/>
                    </form>

                </div>
                    
                 <%
                 if(!rs.next()){
                     %>
                     <br/>
                 No Commodity has been Purchased.
                 <%
                 }
                                 else{%>

                <h3>Edit Bullion Information</h3>
                <div>
                    <form method="post" name="form1" action="../portfolio_jsps/updatebullion.jsp">

                        <table>
                            <th>Metal</th>
                            <th>Quantity</th>
                            <th>Date</th>
                            <th>Investment Price</th>
                            <th>Delete</th>

                            <%rs.beforeFirst();
                            while (rs.next()) {%>
                            <tr>
                                <td><%= rs.getString("commodity_name")%></td>
                                <td><input type="text" required name="quantity" value="<%= rs.getString("quantity")%>" onclick="this.value=''"/></td>
                                <td><input required type="text" class="tcal" name="date" value="<%= rs.getString("date")%>" onclick="this.value=''"/></td>
                                <td><input required type="text" name="price" value="<%= rs.getString("price")%>" onclick="this.value=''"/></td>
                            <input type="hidden" name="bullion_id" value="<%= rs.getString("bullion_id")%>" />
                            <td><input type="checkbox" name="delete" value="<%= rs.getString("bullion_id")%>"/></td>
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
            if(rs.next()){
                float total_inv = 0;
                double ovr_gain = 0;
                DecimalFormat df = new DecimalFormat();
                df.setMaximumFractionDigits(2);
                URL u1 = new URL("http://download.finance.yahoo.com/d/%20quotes.csv?e=.csv&f=l1c6&s='XAUINR=X'");
                URL u2 = new URL("http://download.finance.yahoo.com/d/%20quotes.csv?e=.csv&f=l1c6&s='XAGINR=X'");
                BufferedReader bf1 = new BufferedReader(new InputStreamReader(u1.openStream()));
                BufferedReader bf2 = new BufferedReader(new InputStreamReader(u2.openStream()));
                String dataRow = bf1.readLine();
                String[] dataArray = dataRow.split(",");
                String dataRow2 = bf2.readLine();
                String[] dataArray2 = dataRow2.split(",");
                System.out.println("Gold------" + dataArray[0] + "---------" + dataArray[1]);
                double gold_p = Double.parseDouble(dataArray[0]);
                gold_p = gold_p / 2.83459;
                System.out.println("silver------" + dataArray2[0] + "---------" + dataArray2[1]);
                double silver_p = Double.parseDouble(dataArray2[0]);
                silver_p = silver_p / 0.0283459;
                rs.beforeFirst();
                while (rs.next()) {
                    float pr = Float.parseFloat(rs.getString("price"));
                    int qut = Integer.parseInt(rs.getString("quantity"));
                    total_inv = total_inv + (pr * qut);
                    if (rs.getString("commodity_name").contentEquals("Gold")) {
                        ovr_gain = ovr_gain + ((qut * gold_p) - (qut * pr));
                    } else {
                        ovr_gain = ovr_gain + ((qut * silver_p) - (qut * pr));
                    }
                }

            %>
            <table border="1" cellpadding="8" cellspacing="6">


                <th>Investement</th>

                <th>Overall Gain</th>

                <tr><td><%= String.valueOf(total_inv)%> </td>
                    <td><%= df.format(ovr_gain)%></td>

                </tr>
            </table>
            <br /><br/>

            <table border="1" cellpadding="8" cellspacing="6">
                <th>Metal</th>
                <th>Live Price</th>

                <th>Quantity</th>
                <th>Investment Price</th>
                <th>Investment Date</th>
                <th>Overall Gain</th>
                <th>Overall Gain(%)</th>





                <%
                    rs.beforeFirst();
                    double o_g = 0;
                    double o_gp = 0;
                    while (rs.next()) {
                        int qu = Integer.parseInt(rs.getString("quantity"));
                        float i_p = Float.parseFloat(rs.getString("price"));
                        float x = qu * i_p;
                        if (rs.getString("commodity_name").contentEquals("Gold")) {
                            o_g = (qu * gold_p) - x;
                            o_gp = (100 * o_g) / x;
                        } else {
                            o_g = (qu * silver_p) - x;
                            o_gp = (100 * o_g) / x;
                        }


                %>
                <tr>
                    <td><%= rs.getString("commodity_name")%></td>
                    <%
                    if (rs.getString("commodity_name").contentEquals("Gold")) {%>
                    <td><%= df.format(gold_p)%></td>
                    <% } else {%>
                    <td><%= df.format(silver_p)%></td>
                    <% }%>

                    <td><%= rs.getString("quantity")%></td>
                    <td><%= rs.getString("price")%></td>
                    <td><%= rs.getString("date")%></td>
                    <td><%= df.format(o_g)%> </td>
                    <td><%= df.format(o_gp)%> </td>
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