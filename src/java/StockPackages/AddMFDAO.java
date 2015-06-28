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
public class AddMFDAO {
    static Connection con1;
     public static AddMFBean MFAdd(AddMFBean bean)
    {
        String mf_name=bean.getMf_name();
        String date=bean.getDate();
        float mf_price=bean.getMf_price();
        int quantity=bean.getQuantity();
        String uid=bean.getUid();

        try
        {   
           
            con1=ConnectionManager.getConnection();
            PreparedStatement pt=con1.prepareStatement("Insert into mutualfund_info(mf_name,quantity,date,mf_price,uid) values(?,?,?,?,?)");
            pt.setString(1,mf_name);
            pt.setInt(2,quantity);
            pt.setString(3,date);
            pt.setFloat(4,mf_price);
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
