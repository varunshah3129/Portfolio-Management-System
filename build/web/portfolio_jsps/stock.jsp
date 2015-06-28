
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Connection.ConnectionManager"%>
<!DOCTYPE html>
<%@page import="Client.ClientBean"%>
<html lang="en" dir="ltr">
    <head>
        <title>Stock Portfolio</title>
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
        
        <script type="text/javascript">
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
         <!-- Symbol lookup files -->
        <link rel="stylesheet" type="text/css" href="../SymbolLookup_files/combo"/>
        <script type="text/javascript">
            if(typeof YAHOO == "undefined"){YAHOO={};}
            if(typeof YAHOO.Finance == "undefined"){YAHOO.Finance={};}
            if(typeof YAHOO.Finance.SymbolSuggestConfig == "undefined"){YAHOO.Finance.SymbolSuggestConfig=[];}

            YAHOO.Finance.SymbolSuggestConfig.push({
                dsServer:'http://d.yimg.com/aq/autoc',
                dsRegion:'US',
                dsLang:'en-US',
                acInputId:'txtQuotes',
                acInputFormId:'quote',
                acContainerId:'quoteContainer',
                acInputFocus:'0'
            });
        </script>


        <script type="text/javascript" src="../SymbolLookup_files/combo(8)"></script>

        <script type="text/javascript" src="../SymbolLookup_files/combo(9)"></script>

        <script>
            var ll_js = new Array();
        </script>
        <script>
        
            (function(el) {
                function focusHandler(e){
                    if (e && e.target){
                        e.target == document ? null : e.target;
                        document.activeElement = e.target;
                    }
                }
                // Handle !IE browsers that do not support the .activeElement property
                if(!document.activeElement){
                    if (document.addEventListener){ 
                        document.addEventListener("focus", focusHandler, true);
                    }
                }
            })(document);
            
        
        </script>
        <!-- Symbol lookup files end -->
        
        <!-- / homepage scripts -->
    </head>
    <body>
        <%	String cuid;
            java.sql.Connection con;
            java.sql.Statement s;
            java.sql.ResultSet rs;
            String allsym="";

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
            rs=null;
            try {
                
                con = ConnectionManager.getConnection();
                s = con.createStatement();
                String q = "select * from stock_info where uid='" + cuid + "'";
                rs = s.executeQuery(q);
            } catch (Exception ex) {
                System.out.println(ex);
            }
        %>

        <div id="accordion">
            <h3>Add Stock</h3>
            <div>


                <form name="frm" id="frm" action="/Major_Project/AddStockServlet" method="get" onsubmit="return validate();">
                    <br/>
                    <table>
                        <th>Company Name</th>
                        <th>Quantity</th>
                        <th>Date</th>
                        <th>Price</th>
                        <tr>
                            <td>

                                <div id="searchQuotes" class="ticker-search mod" mode="search">

                                    <input required id="txtQuotes" name="stock_name" value="" type="text" autocomplete="off" class="yui-ac-input"/>

                                </div>
                            </td>

                            <td><input required type="text" name="quantity" /></td>
                            <td><input type="text" required class="tcal" name="date"/></td>
                            <td><input type="text" required name="price" /></td>
                            <td><input type="submit" value="Add" style="background-color:#49743D;font-weight:bold;color:#ffffff;"/></td>
                            <input type="hidden" value="<%=cuid%>" name="uid"/>
                        </tr>
                    </table>
                </form>
            </div>

                         <%
                 if(!rs.next()){
                     %>
                     <br/>
                 No Stock has been Purchased.
                 <%
                 }
                                 else{%>
            <h3>Edit Stock</h3>
            <div>

                <form method="post" name="form1" action="../portfolio_jsps/updatestock.jsp">
                    <table>
                        <th>Company/Sector</th>
                        <th>Quantity</th>
                        <th>Date</th>
                        <th>Investment Price</th>
                        <th>Delete</th>


                        <%
                            String allsym1 = "";
                            int i = 0;
                            rs.beforeFirst();
                            while (rs.next()) {
                                allsym1 = allsym1 + rs.getString("stock_name") + "+";
                        %>

                        <tr>
                            <td><input required type="text" name="stock_name" readonly="readonly" value="<%= rs.getString("stock_name")%>" /></td>
                            <td><input required type="text" name="quantity" value="<%= rs.getString("quantity")%>" onclick="this.value=''"/></td>
                            <td><input required type="text" class="tcal" name="date" value="<%= rs.getString("date")%>" onclick="this.value=''"/></td>
                            <td><input required type="text" name="price" value="<%= rs.getString("price")%>" onclick="this.value=''"/></td>
                            <input type="hidden" name="stock_id" value="<%= rs.getString("stock_id")%>" />
                            <td><input type="checkbox" name="delete" value="<%= rs.getString("stock_id")%>"/></td>

                        </tr>
                        <%
                            }
                            allsym="";
                            try {
                                 allsym = allsym1.substring(0, allsym1.length() - 1);
                            } catch (Exception ex) {
                            System.out.print(ex);
                            }
                        %>
                    </table>
                    <input type="submit" name="update" value="Save Changes" style="background-color:#49743D;font-weight:bold;color:#ffffff;"/>
                </form>
            </div>
                    <% } %>
        </div>

        
        <br /><br/>

         <% rs.beforeFirst();
            if(rs.next()){
                 URL u = new URL("http://finance.yahoo.com/d/quotes.csv?s=" + allsym + "&f=d1l1c6n");
                BufferedReader bf1 = new BufferedReader(new InputStreamReader(u.openStream()));  
                rs.beforeFirst();
                float total_inv=0,latest_value1=0;
                float d_g1=0,o_g1=0;
                String t_i=null;
                String d_g2=null,o_g2=null,latest_value2=null;
               DecimalFormat df=new DecimalFormat();
              
                    df.setMaximumFractionDigits(2);
                while (rs.next()) {
                    
                    int q=Integer.parseInt(rs.getString("quantity"));
                    float i_p=Integer.parseInt(rs.getString("price"));
                    total_inv=total_inv+(q*i_p);
                     t_i=String.valueOf(total_inv);
                     String dataRow1 = bf1.readLine();
                    String[] dataArray1 = dataRow1.split(",");
                    String string1=dataArray1[2].replace("\"", "");
                   float ch1=Float.parseFloat(string1); 
                   float l_p1=Float.parseFloat(dataArray1[1]);
                    d_g1=d_g1+q*ch1;
                    
                    
                    d_g2=df.format(d_g1);
                    
                     o_g1=o_g1+((q*l_p1)-(q*i_p));
                     o_g2=df.format(o_g1);
                     latest_value1=latest_value1+(q*l_p1);
                     latest_value2=df.format(latest_value1);
                }


%>
        <table border="1" cellpadding="8" cellspacing="6">


            <th>Investement</th>
            <th>Today's Gain</th>
            <th>Overall Gain</th>
            <th>Latest Value</th>
            <tr><td><%= t_i%></td>
                <td><%= d_g2%></td>
                <td><%= o_g2%></td>
                <td><%= latest_value2%></td>
            </tr>
        </table>
        <br /><br/>

        <table border="1" cellpadding="8" cellspacing="6">
            <th>Company/Sector Symbol</th>
            <th>Name</th>
            <th>Live Price</th>
            <th>Change</th>
            <th>Quantity</th>
            <th>Investment Price</th>
            <th>Day's Gain</th>
            <th>Day's Gain(%)</th>
            <th>Overall Gain</th>
            <th>Overall Gain(%)</th>
            <th>Latest Value</th>
            <%
                rs.beforeFirst();
             //   URL u = new URL("http://finance.yahoo.com/d/quotes.csv?s=" + allsym + "&f=d1l1c6n");
                BufferedReader bf = new BufferedReader(new InputStreamReader(u.openStream())); 
                while (rs.next()) {%>
            <tr>
                <td><%= rs.getString("stock_name")%></td>
                <%
                    String dataRow = bf.readLine();
                    String[] dataArray = dataRow.split(",");
                      float l_p=Float.parseFloat(dataArray[1]);
                      String string=dataArray[2].replace("\"", "");
                   float ch=Float.parseFloat(string);  
                   float latest_value=0;
                String l_v=null;
                        
                      int q=Integer.parseInt(rs.getString("quantity"));
                    float i_p=Float.parseFloat(rs.getString("price"));
                    float o_g,o_gp,d_g,d_gp,yst_price;
                    float x=q*i_p;
                    latest_value=q*l_p;
                    l_v=String.valueOf(latest_value);
                    d_g=q*ch;
                    if(ch>0)
                                            {
                        yst_price=l_p-ch;
                    } 
                    else{                                            
                        yst_price=l_p+ch;
                                               }
                    d_gp=(ch*100)/yst_price;
                  o_g=(q*l_p)-(x);  
                    o_gp=(100*o_g)/x;
                    String ov_gain=df.format(o_g);
                    String ov_gainp=df.format(o_gp);
                    String day_gain=df.format(d_g);
                    String day_gainp=df.format(d_gp);
    %>

                <td><%=dataArray[3]%></td>
                <td><%=dataArray[1]%></td>
                <td><%=dataArray[2]%></td>
                <td><%= rs.getString("quantity")%></td>
                <td><%= rs.getString("price")%></td>
                <td><%= day_gain%></td>
                <td><%= day_gainp%></td>
                <td><%=ov_gain%></td>
                <td><%=ov_gainp%></td>
                <td><%=l_v%></td>
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