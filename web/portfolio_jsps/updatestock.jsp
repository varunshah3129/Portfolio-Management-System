<%-- 
    Document   : updatestock
    Created on : Mar 2, 2013, 7:21:30 PM
    Author     : Naks
--%>

<%@page import="Client.ClientBean"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Connection.ConnectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <%
            int i;
            String cuid = null;

            ClientBean client = (ClientBean) session.getAttribute("Client");

            session.setAttribute("clienttmp", client);
            if (client == null) {
                response.sendRedirect("../pages/index.jsp");
            } else {
                cuid = client.getUid();
                

                
                String quantity[] = request.getParameterValues("quantity");
                String price[] = request.getParameterValues("price");
                String date[] = request.getParameterValues("date");
                String del[] = request.getParameterValues("delete");
                String stock_id[]=request.getParameterValues("stock_id");

                try {
                    Connection con = ConnectionManager.getConnection();
                    java.sql.Statement st = null;
                    st = con.createStatement();
                    for (i = 0; i < quantity.length; i++) {
                        String quantity1 = quantity[i];
                        String stock_id1 = stock_id[i];
                        String date1 = date[i];
                        String price1 = price[i];
                        st.executeUpdate("update stock_info set quantity=" + quantity1 + ",date='" + date1 + "',price=" + price1 + " where stock_id=" + stock_id1 + "");
                    }
                    if (del != null) {
                        for (i = 0; i < del.length; i++) {
                            String del1 = del[i];
                            st.executeUpdate("DELETE FROM stock_info WHERE stock_id = '" + del1 + "'");
                        }
                    }
                    response.sendRedirect("stock.jsp");
                    
                } catch (Exception e) {
                    System.out.println(e);
                }
            }
        %>

    </body>
</html>