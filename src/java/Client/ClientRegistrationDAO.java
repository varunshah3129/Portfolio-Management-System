/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Client;

import Connection.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Vatsal
 */
public class ClientRegistrationDAO {

    static Connection con1;

    public static ClientBean registration(ClientBean bean) {
        String fname = bean.getFname();
        String lname = bean.getLname();
        String uid = bean.getUid();
        String email = bean.getEmail();
        String password = bean.getPassword();
        String occupation = bean.getOccupation();
        String city = bean.getCity();
        String country = bean.getCountry();
        String gender = bean.getGender();
        String state = bean.getState();
        String dob = bean.getDob();

        long mno = bean.getMno();



        try {
            int i;
            con1 = ConnectionManager.getConnection();
            if (!password.contentEquals("new1")) {
                PreparedStatement pt = con1.prepareStatement("Insert into Registration values(?,?,?,?,?,?,?,?,?,?,?,?)");
                pt.setString(1, fname);
                pt.setString(2, lname);
                pt.setString(3, uid);
                pt.setString(4, password);
                pt.setString(5, email);
                pt.setString(6, dob);
                pt.setLong(7, mno);
                pt.setString(8, gender);
                pt.setString(9, occupation);
                pt.setString(10, country);
                pt.setString(11, state);
                pt.setString(12, city);
                System.out.println(pt);
                i = pt.executeUpdate();
            } else {
                PreparedStatement pt = con1.prepareStatement("Update  Registration set fname='" + fname + "',lname='" + lname + "',dob='" + dob + "',mno=" + mno + ",gender='" + gender + "',occupation='" + occupation + "',country='" + country + "',state='" + state + "',city='" + city + "' where uid='" + uid + "'");
                System.out.println(pt);
                i = pt.executeUpdate();
            }
            if (i != 0) {
                bean.setValid(true);
                System.out.println("bean insert");
            } else {
                bean.setValid(false);
                System.out.println("bean insert failed");
            }
        } catch (Exception e) {
            System.out.println("Error is" + e.getMessage());
        }
        return bean;
    }
}
