<%-- 
    Document   : checkajax
    Created on : Feb 27, 2013, 12:19:13 PM
    Author     : NaKs
--%>

<%@page import="Connection.ConnectionManager"%>
<%@page import="java.sql.*" %> 
<%@page import="java.net.*" %>
<%@page import="java.io.*" %>
<%
String name = request.getParameter("uid").toString();

if(!name.isEmpty())
      { 
String data ="";
try{
            Connection con1=ConnectionManager.getConnection();
           Statement st=con1.createStatement();
           ResultSet rs=st.executeQuery("select * from registration where uid='"+name+"'");
int count=0;
          while(rs.next())
          {

                   count++;
          }

                    if(count>0)
          {
             data="Not Available";
          }
          else
          {
                      data="Available";
          }
out.println(data);
System.out.println(data);
}
catch (Exception e) {
System.out.println(e);
}}
%>