
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Connection.ConnectionManager"%>
<!DOCTYPE html>
<%@page import="Client.ClientBean"%>
<html lang="en" dir="ltr">
    <head>
        <title>Loan Portfolio</title>
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
        <script type="text/javascript">
            function chk_period_unit()
            {
                sel_period= document.getElementById("period_unit1").options[document.getElementById("period_unit1").options.selectedIndex].value
                if(sel_period=="Months")
                {
                    document.getElementById("month_div").style.display = "block";
                    document.getElementById("year_div").style.display = "none";
                    document.getElementById("loan_tenure_m").name="tenure";
                }
                else if(sel_period=="Years")
                {
                    document.getElementById("year_div").style.display = "block";
                    document.getElementById("month_div").style.display = "none";
                    document.getElementById("loan_tenure_y").name="tenure";
                }
                else
                {
                    document.getElementById("month_div").style.display = "none";
                    document.getElementById("year_div").style.display = "none";
                }
            }
                
            function ShowHide(c) {
                subtab="subtab"+c;
                plus="plus"+c;
                if(document.getElementById(subtab).style.display == "none"){
                    document.getElementById(subtab).style.display= "block";
                    document.getElementById(plus).src="../images/minus_icon.gif";
                }
                else{
                    document.getElementById(subtab).style.display= "none";
                    document.getElementById(plus).src="../images/plus_icon.gif";
                }
            }
            function validate()
            {
               
                var noFormat=/^[0-9]+$/  
                 
                 if((document.frm.loan_amt.value.match(noFormat)==null))
                {
                    alert("Insert Correct loan amount value.");
                    
                    return false;
            
                } 
                 else if((document.frm.date.value==""))
                {
                    alert("Insert purchase date");
                    
                    return false;
                }
              
                 else if( (document.frm.rate.value.match(noFormat)==null))
                {
                    alert("Insert Correct interest rate");
                    
                    return false;
                }   
                else{
                    document.frm.submit();
                }
                
            }   
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
                String q = "select * from loan_info where uid='" + cuid + "'";
                rs = s.executeQuery(q);
            %>
            <div id="accordion">
                <h3>Add Loan</h3>
                <div>
                    <form name="frm" method="get" action="/Major_Project/AddLoanServlet" onsubmit="return validate();">
                        <table align="center">
                            <td><b>Select Type</b></td>
                            <td><b>Loan Amount</b></td>
                            <td><b>Tenure</b></td>
                            <td><b>EMI Start Date</b></td>
                            <td><b>Interest Rate(%)</b></td>

                            <tr>
                                <td> <select name="loan_type" id="loan_type">
                                        <option value="Home" selected="selected">Home</option>
                                        <option value="Auto">Auto</option>
                                        <option value="Educational">Educational</option>
                                        <option value="Personal">Personal</option>
                                        <option value="Others">Others</option>
                                    </select>
                                </td>
                                <td><input required type="text" name="loan_amt" /></td>
                                <td>
                                    <select id="period_unit1" required name="period_unit1" onchange="chk_period_unit();">
                                        <option value="">Select</option>
                                        <option value="Months">Months</option>
                                        <option value="Years">Years</option>							
                                    </select>


                                    <div id="month_div" style="display:none;">
                                        <select name="loan_tenure_m" id="loan_tenure_m" >
                                            <option value="">Select Months</option>
                                            <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option><option value="60">60</option><option value="61">61</option><option value="62">62</option><option value="63">63</option><option value="64">64</option><option value="65">65</option><option value="66">66</option><option value="67">67</option><option value="68">68</option><option value="69">69</option><option value="70">70</option><option value="71">71</option><option value="72">72</option><option value="73">73</option><option value="74">74</option><option value="75">75</option><option value="76">76</option><option value="77">77</option><option value="78">78</option><option value="79">79</option><option value="80">80</option><option value="81">81</option><option value="82">82</option><option value="83">83</option><option value="84">84</option><option value="85">85</option><option value="86">86</option><option value="87">87</option><option value="88">88</option><option value="89">89</option><option value="90">90</option><option value="91">91</option><option value="92">92</option><option value="93">93</option><option value="94">94</option><option value="95">95</option><option value="96">96</option><option value="97">97</option><option value="98">98</option><option value="99">99</option><option value="100">100</option><option value="101">101</option><option value="102">102</option><option value="103">103</option><option value="104">104</option><option value="105">105</option><option value="106">106</option><option value="107">107</option><option value="108">108</option><option value="109">109</option><option value="110">110</option><option value="111">111</option><option value="112">112</option><option value="113">113</option><option value="114">114</option><option value="115">115</option><option value="116">116</option><option value="117">117</option><option value="118">118</option><option value="119">119</option><option value="120">120</option><option value="121">121</option><option value="122">122</option><option value="123">123</option><option value="124">124</option><option value="125">125</option><option value="126">126</option><option value="127">127</option><option value="128">128</option><option value="129">129</option><option value="130">130</option><option value="131">131</option><option value="132">132</option><option value="133">133</option><option value="134">134</option><option value="135">135</option><option value="136">136</option><option value="137">137</option><option value="138">138</option><option value="139">139</option><option value="140">140</option><option value="141">141</option><option value="142">142</option><option value="143">143</option><option value="144">144</option><option value="145">145</option><option value="146">146</option><option value="147">147</option><option value="148">148</option><option value="149">149</option><option value="150">150</option><option value="151">151</option><option value="152">152</option><option value="153">153</option><option value="154">154</option><option value="155">155</option><option value="156">156</option><option value="157">157</option><option value="158">158</option><option value="159">159</option><option value="160">160</option><option value="161">161</option><option value="162">162</option><option value="163">163</option><option value="164">164</option><option value="165">165</option><option value="166">166</option><option value="167">167</option><option value="168">168</option><option value="169">169</option><option value="170">170</option><option value="171">171</option><option value="172">172</option><option value="173">173</option><option value="174">174</option><option value="175">175</option><option value="176">176</option><option value="177">177</option><option value="178">178</option><option value="179">179</option><option value="180">180</option><option value="181">181</option><option value="182">182</option><option value="183">183</option><option value="184">184</option><option value="185">185</option><option value="186">186</option><option value="187">187</option><option value="188">188</option><option value="189">189</option><option value="190">190</option><option value="191">191</option><option value="192">192</option><option value="193">193</option><option value="194">194</option><option value="195">195</option><option value="196">196</option><option value="197">197</option><option value="198">198</option><option value="199">199</option><option value="200">200</option><option value="201">201</option><option value="202">202</option><option value="203">203</option><option value="204">204</option><option value="205">205</option><option value="206">206</option><option value="207">207</option><option value="208">208</option><option value="209">209</option><option value="210">210</option><option value="211">211</option><option value="212">212</option><option value="213">213</option><option value="214">214</option><option value="215">215</option><option value="216">216</option><option value="217">217</option><option value="218">218</option><option value="219">219</option><option value="220">220</option><option value="221">221</option><option value="222">222</option><option value="223">223</option><option value="224">224</option><option value="225">225</option><option value="226">226</option><option value="227">227</option><option value="228">228</option><option value="229">229</option><option value="230">230</option><option value="231">231</option><option value="232">232</option><option value="233">233</option><option value="234">234</option><option value="235">235</option><option value="236">236</option><option value="237">237</option><option value="238">238</option><option value="239">239</option><option value="240">240</option><option value="241">241</option><option value="242">242</option><option value="243">243</option><option value="244">244</option><option value="245">245</option><option value="246">246</option><option value="247">247</option><option value="248">248</option><option value="249">249</option><option value="250">250</option><option value="251">251</option><option value="252">252</option><option value="253">253</option><option value="254">254</option><option value="255">255</option><option value="256">256</option><option value="257">257</option><option value="258">258</option><option value="259">259</option><option value="260">260</option><option value="261">261</option><option value="262">262</option><option value="263">263</option><option value="264">264</option><option value="265">265</option><option value="266">266</option><option value="267">267</option><option value="268">268</option><option value="269">269</option><option value="270">270</option><option value="271">271</option><option value="272">272</option><option value="273">273</option><option value="274">274</option><option value="275">275</option><option value="276">276</option><option value="277">277</option><option value="278">278</option><option value="279">279</option><option value="280">280</option><option value="281">281</option><option value="282">282</option><option value="283">283</option><option value="284">284</option><option value="285">285</option><option value="286">286</option><option value="287">287</option><option value="288">288</option><option value="289">289</option><option value="290">290</option><option value="291">291</option><option value="292">292</option><option value="293">293</option><option value="294">294</option><option value="295">295</option><option value="296">296</option><option value="297">297</option><option value="298">298</option><option value="299">299</option><option value="300">300</option><option value="301">301</option><option value="302">302</option><option value="303">303</option><option value="304">304</option><option value="305">305</option><option value="306">306</option><option value="307">307</option><option value="308">308</option><option value="309">309</option><option value="310">310</option><option value="311">311</option><option value="312">312</option><option value="313">313</option><option value="314">314</option><option value="315">315</option><option value="316">316</option><option value="317">317</option><option value="318">318</option><option value="319">319</option><option value="320">320</option><option value="321">321</option><option value="322">322</option><option value="323">323</option><option value="324">324</option><option value="325">325</option><option value="326">326</option><option value="327">327</option><option value="328">328</option><option value="329">329</option><option value="330">330</option><option value="331">331</option><option value="332">332</option><option value="333">333</option><option value="334">334</option><option value="335">335</option><option value="336">336</option><option value="337">337</option><option value="338">338</option><option value="339">339</option><option value="340">340</option><option value="341">341</option><option value="342">342</option><option value="343">343</option><option value="344">344</option><option value="345">345</option><option value="346">346</option><option value="347">347</option><option value="348">348</option><option value="349">349</option><option value="350">350</option><option value="351">351</option><option value="352">352</option><option value="353">353</option><option value="354">354</option><option value="355">355</option><option value="356">356</option><option value="357">357</option><option value="358">358</option><option value="359">359</option><option value="360">360</option>						</select>
                                    </div>
                                    <div id="year_div" style="display: none;">
                                        <select name="loan_tenure_y" id="loan_tenure_y" >
                                            <option value="">Select Years</option>
                                            <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option>						</select>
                                    </div> 
                                </td>
                                <td><input required type="text" class="tcal" name="emi_start_date"/></td>
                                <td><input required type="text" name="rate"/></td>
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
                 No Loan has been taken.
                 <%
                 }
                                 else{%>
                <h3>Edit Loan Information</h3>
                <div>
                <form method="post" name="form1" action="../portfolio_jsps/updateloan.jsp">

                    <table align="center">
                        <td><b>Select Type</b></td>
                        <td><b>Loan Amount</b></td>
                        <td><b>Tenure</b></td>
                        <td><b>EMI Start Date</b></td>
                        <td><b>Interest Rate(%)</b></td>
                        <td><b>Delete</b></td>
                        <%rs.beforeFirst();
                        while (rs.next()) {%>

                        <tr>
                            <%  String temp = rs.getString("loan_type");%>

                            <c:set var="l" value = "<%=temp%>" />

                            <td> <select name="loan_type" id="loan_type">
                                    <option <c:if test="${l =='Home'}" > selected </c:if> value="Home">Home</option>
                                    <option <c:if test="${l =='Auto'}" > selected </c:if> value="Auto">Auto</option>
                                    <option <c:if test="${l =='Educational'}" > selected </c:if> value="Educational">Educational</option>
                                    <option <c:if test="${l =='Personal'}" > selected </c:if> value="Personal">Personal</option>
                                    <option <c:if test="${l =='Others'}" > selected </c:if> value="Others">Others</option>
                                </select>
                            </td>

                            <td><input type="text" name="loan_amt" value="<%= rs.getString("loan_amt")%>" onclick="this.value=''"/></td>
                            <td>
                                <%  String temp1 = rs.getString("period_unit");%>
                                <c:set var="l1" value = "<%=temp1%>" />
                                <select id="period_unit" name="period_unit" >
                                    <option value="">Select</option>
                                    <option <c:if test="${l1 =='Months'}" > selected </c:if> value="Months">Months</option>
                                    <option <c:if test="${l1 =='Years'}" > selected </c:if> value="Years">Years</option>							
                                </select>

                                <input required type="text" name="tenure" value="<%=rs.getString("tenure")%>" onclick="this.value=''"></input>


                            </td>

                            <td><input required type="text" class="tcal" name="emi_start_date" value="<%= rs.getString("emi_start_date")%>" onclick="this.value=''"/></td>
                            <td><input required type="text" name="rate" value="<%= rs.getString("rate")%>" onclick="this.value=''"/></td>
                            <td><input type="checkbox" name="delete" value="<%= rs.getString("loan_id")%>"/></td>
                            <input type="hidden" name="loan_id" value="<%= rs.getString("loan_id")%>" />
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
            <table border="2px" cellpadding="6px" align="center">


                <th>Loan Type</th>
                <th>Loan Amount</th>
                <th>EMI Start Date</th>
                <th>Tenure</th>
                <th>Interest Rate</th>
                <th>Total EMI</th>


                <%  int c = 0;
                    rs.beforeFirst();
                    while (rs.next()) {
                        double EMI = 0;
                        String EMI1 = null;
                        float loan_amt = Float.parseFloat(rs.getString("loan_amt"));
                        float rate = Float.parseFloat(rs.getString("rate"));
                        rate = rate / 100;
                        rate = rate / 12;
                        String period_unit = rs.getString("period_unit");
                        int n;
                        int tenure = Integer.parseInt(rs.getString("tenure"));
                        if (period_unit.contentEquals("Years")) {
                            n = tenure * 12;
                        } else {
                            n = tenure;
                        }
                        double x = java.lang.Math.pow((1 + rate), n);
                        EMI = loan_amt * rate * x;
                        EMI = EMI / (x - 1);
                        DecimalFormat df = new DecimalFormat();
                        df.setMaximumFractionDigits(2);
                        EMI1 = df.format(EMI);
                %>
                <tr>
                    <td><%= rs.getString("loan_type")%></td>
                    <td><%= rs.getString("loan_amt")%></td>
                    <td><%= rs.getString("emi_start_date")%></td>
                    <td><%= rs.getString("tenure")%>  <%= rs.getString("period_unit")%> </td>
                    <td><%= rs.getString("rate")%></td>
                    <td><%=EMI1%></td>


                </tr>
                <tr><td colspan="10"><a href="#" onclick="ShowHide(<%=c%>);" ><img id="plus<%=c%>" src="../images/plus_icon.gif"></img> Details For Future Payments</a> 


                        <div id="subtab<%=c%>" style="display: none;">
                            <%c++;%>
                            <table border="1px" align="center">


                                <th>Month</th>
                                <th>EMI Date</th>
                                <th>Open Principal</th>
                                <th>EMI</th>
                                <th>Interest</th>
                                <th>Principal</th>
                                <th>Close Balance</th>

                                <%
                                    int i;
                                    String month = null;
                                    String year = null;
                                    String date = null;
                                    String f_d = null;
                                    String mnt = null;
                                    String yr = null;
                                    String dt = null;
                                    String date1 = rs.getString("emi_start_date");
                                    mnt = date1.substring(1, 2);
                                    yr = date1.substring(6);
                                    dt = date1.substring(3, 5);
                                    int rt = Integer.parseInt(rs.getString("rate"));
                                    double p_amt = Double.parseDouble(rs.getString("loan_amt"));
                                    double interest;

                                    double princ;

                                    double close_balance[] = new double[n];


                                    int count = 1;
                                    int mnt1 = Integer.parseInt(mnt);
                                    int yr1 = Integer.parseInt(yr);
                                    int dt1 = Integer.parseInt(dt);

                                    for (i = 0; i < n; i++) {

                                        interest = (double) p_amt * rt / 1200;
                                        princ = EMI - interest;
                                        close_balance[i] = p_amt - princ;



                                        if (mnt1 == 12) {
                                            mnt1 = 1;
                                            yr1++;
                                            f_d = String.valueOf(mnt1) + "/" + String.valueOf(dt1) + "/" + String.valueOf(yr1);
                                        } else {
                                            mnt1++;
                                            f_d = String.valueOf(mnt1) + "/" + String.valueOf(dt1) + "/" + String.valueOf(yr1);
                                        }

                                %>
                                <tr>                

                                    <td><%= df.format(count)%> </td>
                                    <td><%= f_d%></td>
                                    <td><%= df.format(p_amt)%> </td>
                                    <td><%= df.format(EMI)%> </td>
                                    <td><%= df.format(interest)%> </td>
                                    <td><%= df.format(princ)%> </td>
                                    <td><%= df.format(close_balance[i])%> </td>
                                </tr>

                                <%
                                        p_amt = close_balance[i];
                                        count++;

                                    }%>
                        </div>

            </table>
        </td></tr> 

    <%   }
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