/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package StockPackages;

import Connection.ConnectionManager;
import java.sql.PreparedStatement;
import java.sql.Connection;

/**
 *
 * @author Vatsal
 */
public class AddLoanDAO {
    static Connection con1;  
    public static AddLoanBean LoanAdd(AddLoanBean bean)
    {
        String loan_type=bean.getLoan_type();
        int tenure=bean.getTenure();
        String period_unit=bean.getPeriod_unit();
        String emi_start_date=bean.getEmi_start_date();
        float rate=bean.getRate();
        float loan_amt=bean.getLoan_amt();
        String uid=bean.getUid();
       
        
        
        
        try
        {   
           
            con1=ConnectionManager.getConnection();
            PreparedStatement pt=con1.prepareStatement("Insert into loan_info(loan_type,loan_amt,emi_start_date,rate,period_unit,tenure,uid) values(?,?,?,?,?,?,?)");
            pt.setString(1,loan_type);
            pt.setFloat(2,loan_amt);
            pt.setString(3,emi_start_date);
            pt.setFloat(4,rate);
            pt.setString(5,period_unit);
            pt.setInt(6,tenure);
            pt.setString(7, uid);
           
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
