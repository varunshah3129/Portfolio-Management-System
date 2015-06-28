<%-- 
    Document   : updateloan
    Created on : Mar 4, 2013, 9:59:32 AM
    Author     : Vatsal
--%>
<%@page import="Client.ClientBean"%>

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
                
                String loan_type[] = request.getParameterValues("loan_type");
                String loan_id[] = request.getParameterValues("loan_id");
                String loan_amt[] = request.getParameterValues("loan_amt");
                String rate[] = request.getParameterValues("rate");
                String emi_start_date[] = request.getParameterValues("emi_start_date");
                 String period_unit[] = request.getParameterValues("period_unit");
                  String tenure[] = request.getParameterValues("tenure");
                String del[] = request.getParameterValues("delete");
                


                try {
                    Connection con = ConnectionManager.getConnection();
                    java.sql.Statement st = null;
                    st = con.createStatement();
                    for (i = 0; i < loan_type.length; i++) {
                        String loan_type1=loan_type[i];
                        String loan_id1 = loan_id[i];
                        String loan_amt1 = loan_amt[i];
                        String emi_start_date1 = emi_start_date[i];
                        String rate1 = rate[i];
                        String period_unit1 = period_unit[i];
                        String tenure1 = tenure[i];
                        System.out.print("--" + tenure1);
                        
                        st.executeUpdate("update loan_info set loan_type='" + loan_type1 + "',emi_start_date='" + emi_start_date1 + "',loan_amt=" + loan_amt1 + ",tenure="+tenure1+",period_unit='"+period_unit1+"',rate=" + rate1 + " where loan_id=" + loan_id1 + "");
                    }
                    if (del != null) {
                        for (i = 0; i < del.length; i++) {
                            String del1 = del[i];
                            st.executeUpdate("DELETE FROM loan_info WHERE loan_id = '" + del1 + "'");
                        }
                    }
                    response.sendRedirect("loan.jsp");
                } catch (Exception e) {
                    System.out.println(e);
                }
            }
        %>

    </body>
</html>
