/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Vatsal
 */
public class ConnectionManager {
    static Connection con;
    
    public static Connection getConnection() throws Exception
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio", "root", "root");
        return con;
    }
}
