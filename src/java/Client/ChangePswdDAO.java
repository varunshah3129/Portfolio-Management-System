/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Client;

import Connection.ConnectionManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author NaKs
 */
public class ChangePswdDAO {

    static Connection con1;
    static Statement st;
    static ResultSet rs;
    static String qry,cuid;
    static int i;
    

    public static ChangePswdBean changepswd(ChangePswdBean bean) {
        try {
            con1 = ConnectionManager.getConnection();

            st = con1.createStatement();
            
            String npassword = bean.getNpassword();
            String opassword = bean.getOpassword();
            String username = bean.getUsername();
            
            qry = "select password from registration where uid='" + username + "'";

            System.out.println(qry);

            rs = st.executeQuery(qry);
            rs.next();
            
            String opswd=rs.getString("password");
            System.out.println("Old pswd------------"+opswd);
            
            if(opswd.contentEquals(opassword)){
            qry="Update registration set password='"+ npassword +"' where uid='"+ username +"'";
            System.out.println(qry);
            i=st.executeUpdate(qry);
                System.out.println("i---------------->" +i);
            JOptionPane.showMessageDialog(null, "Password changed successfully");
            }
            else{
                JOptionPane.showMessageDialog(null, "Enter Correct Old Password");
            }
       
            if (i != 0) {
                bean.setValid(true);
                System.out.println("Bean Updated");
            } else {
                bean.setValid(false);
                System.out.println("Bean not updated.");
            }
        } catch (Exception e) {
            System.out.println("Error in LoginDAO " + e.getMessage());
            e.printStackTrace();
        }

        return bean;

    }
}
