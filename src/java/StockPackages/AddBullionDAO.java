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
public class AddBullionDAO {
     static Connection con1; 
    public static AddBullionBean BullionAdd(AddBullionBean bean)
    {
        String commodity_name=bean.getCommodity_name();
        String date=bean.getDate();
        float price=bean.getPrice();
        int quantity=bean.getQuantity();
        String uid=bean.getUid();
       
        
        
        
        try
        {   
          
            con1=ConnectionManager.getConnection();
            PreparedStatement pt=con1.prepareStatement("Insert into bullion_info(commodity_name,quantity,date,price,uid) values(?,?,?,?,?)");
            pt.setString(1,commodity_name);
            pt.setInt(2,quantity);
            pt.setString(3,date);
            pt.setFloat(4,price);
            pt.setString(5,uid);
           
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
