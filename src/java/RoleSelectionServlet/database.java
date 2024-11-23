/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package RoleSelectionServlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author LuckyCharm
 */
public class database {

    public static boolean validate(String email, String pass, String mskKey) {
        boolean status = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mabsk", "root", "");
            PreparedStatement ps = con.prepareStatement(
                    "select * from data_owner where email=? and password=? and msk_key=? ");
            ps.setString(1, email);
            ps.setString(2, pass);
            ps.setString(3, mskKey);

            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static boolean uservalidate(String email, String pass) {
        boolean status = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mabsk", "root", "");
            PreparedStatement ps = con.prepareStatement(
                    "select * from data_user where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static boolean CloudProvidervalidate(String email, String pass, String sId) {
        boolean status = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mabsk", "root", "");
            PreparedStatement ps = con.prepareStatement(
                    "select * from cloudprovider where email=? and password=? and secretId=?");
            ps.setString(1, email);
            ps.setString(2, pass);
            ps.setString(3, sId);

            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return status;
    }
}
