package org.apache.jsp.pages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Client.ClientBean;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\" dir=\"ltr\">\n");
      out.write("<head>\n");
      out.write("<title>My Portfolio</title>\n");
      out.write("<meta charset=\"iso-8859-1\">\n");
      out.write("<link rel=\"stylesheet\" href=\"../css/layout.css\" type=\"text/css\">\n");
      out.write("<script src=\"../js/jquery-1.8.2.min.js\"></script>\n");
      out.write("<script src=\"../js/jquery-defaultvalue.js\"></script>\n");
      out.write("<script src=\"../js/jquery-browsercheck.js\"></script>\n");
      out.write("    \n");
      out.write("<script type=\"text/javascript\" src=\"../js/md5.js\"></script>\n");
      out.write("\n");
      out.write("<!-- homepage scripts -->\n");
      out.write("<script src=\"../js/jquery-innerfade.js\"></script>\n");
      out.write("\n");
      out.write("<!-- / homepage scripts -->\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    ");
	String cuid;
                ClientBean client=(ClientBean) session.getAttribute("Client");
          
            //   session.setAttribute("clienttmp", client);
            if (client != null) {
                response.sendRedirect("client_home.jsp");
            } else {
               
        
      out.write("\n");
      out.write("<div class=\"wrapper row1\">\n");
      out.write("  <header id=\"header\" class=\"clear\">\n");
      out.write("    <hgroup>\n");
      out.write("      <h1><a href=\"#\"><img src=\"../images/logo.png\"/></a></h1>\n");
      out.write("      <img src=\"../images/description.gif\"/>\n");
      out.write("    </hgroup>\n");
      out.write("    <form method=\"post\" action=\"/Major_Project/ClientLoginServlet\">\n");
      out.write("      <fieldset>\n");
      out.write("        \n");
      out.write("        <input type=\"text\" name=\"username\"  value=\"Userid\" onclick=\"this.value = ''\" class=\"uimage\">\n");
      out.write("\n");
      out.write("                    <input type=\"password\" name=\"password\"  value=\"Password\" onclick=\"this.value = ''\" class=\"pimage\">\n");
      out.write("                                            </br>\n");
      out.write("        <input type=\"submit\" id=\"sf_submit\" value=\"Login\" onclick=\"password.value=calcMD5(password.value);\">\n");
      out.write("        </br>\n");
      out.write("        <a href=\"../Client/registration.html\">Not a Member Yet?</a>\n");
      out.write("        &nbsp;&nbsp;\n");
      out.write("        <a href=\"../Client/ForgotPswd.jsp\">Forgot Password?</a>\n");
      out.write("      </fieldset>\n");
      out.write("    </form>\n");
      out.write("    \n");
      out.write("  </header>\n");
      out.write("</div>\n");
      out.write("<div class=\"wrapper row2\">\n");
      out.write("  <nav id=\"topnav\">\n");
      out.write("    <ul class=\"clear\">\n");
      out.write("      <li class=\"active\"><a href=\"index.jsp\">Home</a></li>\n");
      out.write("      <li><a href=\"services.jsp\">SERVICES</a></li>\n");
      out.write("      <li><a href=\"contactus.html\">CONTACT US</a></li>\n");
      out.write("      <li ><a href=\"aboutus.jsp\">ABOUT US</a></li>\n");
      out.write("         \n");
      out.write("    </ul>\n");
      out.write("  </nav>\n");
      out.write("</div>\n");
      out.write("<!-- content -->\n");
      out.write("<div class=\"wrapper row3\">\n");
      out.write("  <div id=\"container\" class=\"clear\">\n");
      out.write("    <!-- content body -->\n");
      out.write("    \n");
      out.write("    <div id=\"content\">\n");
      out.write("      \n");
      out.write("     <section>\n");
      out.write("        \n");
      out.write("        <script src=\"//www.gmodules.com/ig/ifr?url=http://hosting.gmodules.com/ig/gadgets/file/102891932573414116126/Market-Ticker.xml&amp;synd=open&amp;w=600&amp;h=46&amp;title=Sensex+Ticker&amp;border=%23ffffff%7C3px%2C1px+solid+%23999999&amp;output=js\"></script>\n");
      out.write("        <br/>\n");
      out.write("      </section>\n");
      out.write("        <section>\n");
      out.write("        <a title='Gold Coin Prices' target='_blank' href='http://www.goldshark.com'><img alt='Gold Coin Prices' width='535' height='104' src='http://graphics.goldshark.com/values/wider.png' border='0' style='max-width:100% !important; margin:0;padding:0;'/></a>\n");
      out.write("      </section>\n");
      out.write("        <section>\n");
      out.write("        <figure class=\"imgr\"><img src=\"../images/3.jpg\" alt=\"\" width=\"170\" height=\"125\"></figure>\n");
      out.write("        <p>Customise this portfolio and start tracking all your investments and assets including Stocks, Mutual Funds, ULIPs and Bullion, through live price updates.</p>\n");
      out.write("        <p>The system allows the clients to create multiple accounts in his single portfolio account. All the details filled by him help him in generating his return statement of after paying the text. He can also generate his profit and loss reports and thus can keep a check on the buying and selling of his holdings & securities. This will make him aware of his daily profits and losses so that we can access then and can take require decisions. </p>\n");
      out.write("        \n");
      out.write("        <figure class=\"imgl\"><img src=\"../images/1.jpg\" alt=\"\" width=\"170\" height=\"125\"></figure>\n");
      out.write("        <p>When you sell or buy stock and you use a complicated spreadsheet program, it can take all day to edit your stock portfolio. Using a personal finance website program, however, makes it much easier. You can usually edit the stocks in your chart simply by pointing and clicking, which leaves you time to accomplish other tasks during the day.</p>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("      </section>\n");
      out.write("      \n");
      out.write("    </div>\n");
      out.write("    <!-- right column -->\n");
      out.write("    <aside id=\"right_column\">\n");
      out.write("      \n");
      out.write("      <h2>Current Market</h2>\n");
      out.write("      <section>\n");
      out.write("           <script type=\"text/javascript\">var _mcq=[\"6\",\"\"];</script><span id='_mc_mg6'></span><script language=\"JavaScript\" src=\"http://stat1.moneycontrol.com/mcjs/common/mc_widget.js\"></script><noscript><a href=\"http://www.moneycontrol.com\">Sensex/Nifty</a></noscript>\n");
      out.write("      </section>\n");
      out.write("      <!-- /nav -->\n");
      out.write("      <section>\n");
      out.write("        <h2>Market News</h2>\n");
      out.write("        <script type=\"text/javascript\" src=\"http://cdn.widgetserver.com/syndication/subscriber/InsertWidget.js\"></script><script type=\"text/javascript\">if (WIDGETBOX) WIDGETBOX.renderWidget('0018136f-5675-4544-9224-3c724730de7d');</script>\n");
      out.write("        \n");
      out.write("      </section>\n");
      out.write("    </aside>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<!-- Footer -->\n");
      out.write("<div class=\"wrapper row4\">\n");
      out.write("  <div id=\"footer\" class=\"clear\">\n");
      out.write("    <!-- Section One -->\n");
      out.write("    <section class=\"one_quarter first\">\n");
      out.write("      <h2 class=\"title\">Contact Details</h2>\n");
      out.write("      \n");
      out.write("    Varun Shah<br>\n");
      out.write("     Payal Gandhi <br>\n");
      out.write("      \n");
      out.write("      <p>Mo: 9016099269<br>\n");
      out.write("        Fax: xxxxx xxxxxxxxxx<br>\n");
      out.write("        Email: <a href=\"#\">Vshah22@horizon.csueastbay.edu</a></p>\n");
      out.write("    </section>\n");
      out.write("    <!-- Section Two -->\n");
      out.write("    <section class=\"one_quarter\">\n");
      out.write("      <h2 class=\"title\">Quick Links</h2>\n");
      out.write("      <nav>\n");
      out.write("        <ul>\n");
      out.write("          <li class=\"first\"><a href=\"http://www.moneycontrol.com/news/\">News</a></li>\n");
      out.write("          <li><a href=\"http://www.moneycontrol.com/terminal/\">Live Sensex</a></li>\n");
      out.write("          <li><a href=\"http://www.moneycontrol.com/commodity/\">Commodities Prices</a></li>\n");
      out.write("          <li><a href=\"http://www.moneycontrol.com/fixed-income/small-savings-schemes/\">Small Savings Schemes</a></li>\n");
      out.write("        </ul>\n");
      out.write("      </nav>\n");
      out.write("    </section>\n");
      out.write("    <!-- Section Three -->\n");
      out.write("      <section class=\"one_quarter\">\n");
      out.write("      <h2 class=\"title\">Suggestions From Blogs</h2>\n");
      out.write("      <nav>\n");
      out.write("        <ul>\n");
      out.write("          <li class=\"first\"><a href=\"http://the-finance-blog.blogspot.in/\">The Finance Blog</a></li>\n");
      out.write("          <li><a href=\"http://bigfatfinanceblog.com/\">Big Fat Finance Blog</a></li>\n");
      out.write("          <li><a href=\"http://in.finance.yahoo.com/blogs/economaniac/\">Yahoo Finance Blog</a></li>\n");
      out.write("          <li><a href=\"http://googlefinanceblog.blogspot.in/\">Google Finance Blog</a></li>\n");
      out.write("        </ul>\n");
      out.write("      </nav>\n");
      out.write("    </section>\n");
      out.write("    <!-- Section Four -->\n");
      out.write("    <section class=\"one_quarter\">\n");
      out.write("      <h2 class=\"title\">Grab Our Newsletter</h2>\n");
      out.write("      <form method=\"post\" action=\"#\">\n");
      out.write("        <fieldset>\n");
      out.write("          <legend>Contact Form:</legend>\n");
      out.write("          <label for=\"nl_name\">Name:</label>\n");
      out.write("          <input type=\"text\" name=\"nl_name\" value=\"Name\" id=\"nl_name\" onclick=\"this.value=''\">\n");
      out.write("          <label for=\"nl_email\">Email:</label>\n");
      out.write("          <input type=\"text\" name=\"nl_email\" id=\"nl_email\" value=\"Email\" onclick=\"this.value=''\">\n");
      out.write("          <button type=\"submit\" value=\"submit\">Submit</button>\n");
      out.write("        </fieldset>\n");
      out.write("      </form>\n");
      out.write("    </section>\n");
      out.write("    <!-- / Section -->\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("<!-- Copyright -->\n");
      out.write("<div class=\"wrapper row5\">\n");
      out.write("  <footer id=\"copyright\" class=\"clear\">\n");
      out.write("    <p class=\"fl_left\">Copyright &copy; 2015 - All Rights Reserved</p>\n");
      out.write("    <p class=\"fl_right\">Designed by Varun Shah &AMP; Payal Gandhi</p>\n");
      out.write("  </footer>\n");
      out.write("</div>\n");
      out.write("<script>\n");
      out.write("$(document).ready(function () {\n");
      out.write("    $(\"#nl_name, #nl_email\").defaultvalue(\"Name\", \"Email Address\");\n");
      out.write("});\n");
      out.write("</script>\n");
 } 
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
