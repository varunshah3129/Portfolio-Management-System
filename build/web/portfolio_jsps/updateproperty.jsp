<%-- 
    Document   : updateproperty
    Created on : Mar 4, 2013, 10:00:32 AM
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
            java.sql.Statement st;
            ClientBean client = (ClientBean) session.getAttribute("Client");

            session.setAttribute("clienttmp", client);
            if (client == null) {
                response.sendRedirect("../pages/index.jsp");
            } else {
                cuid = client.getUid();


                
                String location[] = request.getParameterValues("location");
                
                String price[] = request.getParameterValues("price");
                String date[] = request.getParameterValues("date");
                String del[] = request.getParameterValues("delete");
                String latest_price[] = request.getParameterValues("latest_price");
                String fixedassest_id[]=request.getParameterValues("fixedassest_id");
                System.out.println("update-----" + cuid);
                try {
                    Connection con = ConnectionManager.getConnection();

                    st = con.createStatement();
                    System.out.println("123");
                    for (i = 0; i < location.length; i++) {
                        String location1 = location[i];
                        String fixedassest_id1=fixedassest_id[i];
                        
                        String date1 = date[i];
                        String price1 = price[i];
                        String latest_price1 = latest_price[i];
                        
                        st.executeUpdate("update property_info set location='" + location1 + "',date='" + date1 + "',price=" + price1 + ",latest_price=" + latest_price1 + " where fixedassest_id=" + fixedassest_id1 +"");
                    }
                    if (del != null) {
                        for (i = 0; i < del.length; i++) {
                            String del1 = del[i];
                            st.executeUpdate("DELETE FROM property_info WHERE fixedassest_id = '" + del1 + "'");
                        }
                    }
                    response.sendRedirect("property.jsp");
                } catch (Exception e) {
                    System.out.println("Exception is"+e);
                }
            }
        %>

    </body>
</html>
