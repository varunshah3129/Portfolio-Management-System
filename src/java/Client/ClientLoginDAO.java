/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Client;

import Connection.ConnectionManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Vatsal
 */
public class ClientLoginDAO {
    static Connection con1;
    static Statement st;
    static ResultSet rs;
    static String qry;
    
    public static ClientBean login(ClientBean bean)
            {
                String username = bean.getUid();
                String password = bean.getPassword();
		
		System.out.println(username + " " + password);
		
                try
                {
			con1 = ConnectionManager.getConnection();
			
			st = con1.createStatement();
			
			qry = "select uid,password from registration where uid='"+username+"' and password='"+password+"'";
		    
			System.out.println(qry);
		    
			rs = st.executeQuery(qry);
                    
			boolean more = false;
		    
			while(rs.next())
			{    
				more = true;
				System.out.println(more);
			}
			if(more)
                        {
				bean.setValid(true);
                        }
			else   
                        {
				bean.setValid(false);
                        }
                }
                catch(Exception e)
                {
			System.out.println("Error in LoginDAO " + e.getMessage());
			e.printStackTrace();
                }
		
                return bean;
            }
    
}
