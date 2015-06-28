/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package StockPackages;

import Connection.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Vatsal
 */
public class AddPropertyDAO {
     static Connection con1; 
    public static AddPropertyBean PropertyAdd(AddPropertyBean bean)
    {
        String prop_name=bean.getProp_name();
        String date=bean.getDate();
        float price=bean.getPrice();
        float latest_price=bean.getLatest_price();
        String location=bean.getLocation();
        String uid=bean.getUid();
       
        
        
        
        try
        {   
           
            con1=ConnectionManager.getConnection();
            PreparedStatement pt=con1.prepareStatement("Insert into property_info(prop_name,price,location,date,latest_price,uid) values(?,?,?,?,?,?)");
            pt.setString(1,prop_name);
            pt.setFloat(2,price);
            pt.setString(3, location);
            pt.setString(4,date);
            pt.setFloat(5,latest_price);
            pt.setString(6,uid);
           
            int i=pt.executeUpdate();
            System.out.println(i);
            if(i!=0)
            {
                bean.setValid(true);
                System.out.println("bean insert");
            }
            else
            {
                bean.setValid(false);
                System.out.println("123");
            }
        }
        catch(Exception e)
        {
            System.out.println("Error is"+e.getMessage());
            e.printStackTrace();
        }
        return bean;
    }
}
