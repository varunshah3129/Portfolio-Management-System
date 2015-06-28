<%-- 
    Document   : updatebullion
    Created on : Mar 4, 2013, 9:59:13 AM
    Author     : Vatsal
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


                String commodity_name[] = request.getParameterValues("commodity_name");
                String quantity[] = request.getParameterValues("quantity");
                String price[] = request.getParameterValues("price");
                String date[] = request.getParameterValues("date");
                String del[] = request.getParameterValues("delete");
                String bullion_id[] = request.getParameterValues("bullion_id");

                try {
                    Connection con = ConnectionManager.getConnection();
                    java.sql.Statement st = null;
                    st = con.createStatement();
                    for (i = 0; i < quantity.length; i++) {
                        String quantity1 = quantity[i];
                        String bullion_id1 = bullion_id[i];
                        String date1 = date[i];
                        String price1 = price[i];
                        st.executeUpdate("update bullion_info set quantity=" + quantity1 + ",date='" + date1 + "',price=" + price1 + " where bullion_id=" + bullion_id1 + " ");
                    }
                    if (del != null) {
                        for (i = 0; i < del.length; i++) {
                            String del1 = del[i];
                            st.executeUpdate("DELETE FROM bullion_info WHERE bullion_id = '" + del1 + "'");
                        }
                    }
                    response.sendRedirect("bullion.jsp");
                } catch (Exception e) {
                    System.out.println(e);
                }
            }
        %>

    </body>
</html>
