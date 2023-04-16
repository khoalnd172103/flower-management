/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import sample.dto.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sample.utils.MyConnection;

/**
 *
 * @author Admin
 */
public class AccountDAO {

    // login
    public static Account getAccount(String email, String password) throws Exception {
        Account acc = null;
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT * FROM Accounts\n"
                    + "WHERE email = ? AND password = ? Collate latin1_general_ci_as";

            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                int accid = rs.getInt("accID");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                int status = rs.getInt("status");
                int role = rs.getInt("role");
                acc = new Account(accid, email, password, fullname, phone, status, role);
            }
            cn.close();
        }
        return acc;
    }

    // Get all accounts
    public static ArrayList<Account> getAccounts() throws Exception {
        ArrayList<Account> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [accID], [email], [password], [fullname],\n"
                    + "[phone], [status], [role]\n"
                    + "FROM [dbo].[Accounts]";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int accid = rs.getInt("accID");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String fullname = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    int status = rs.getInt("status");
                    int role = rs.getInt("role");
                    //int token = rs.getInt("token");
                    Account acc = new Account(accid, email, password, fullname, phone, status, role);
                    list.add(acc);
                }
            }
            cn.close();
        }
        return list;
    }

    //Insert function
    public static int insertAccount(String email, String password, String fullName, String phone, int status, int role) throws SQLException, Exception {
        int result = -1;
        Connection cn = MyConnection.makeConnection();
        try {
            if (cn != null) {
                String sql = "INSERT dbo.Accounts([email], [password], [fullname], [phone], [status], [role])\n"
                        + "VALUES (?,?,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                pst.setString(3, fullName);
                pst.setString(4, phone);
                pst.setInt(5, status);
                pst.setInt(6, role);
                result = pst.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        try {
            if (cn != null) {
                cn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
        return result;
    }

    // Update profle function
    public static int updateAccount(String fullname, String phone, String email) throws Exception {
        int result = 0;
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "UPDATE [dbo].[Accounts]\n"
                    + "SET [fullname] = ?,\n"
                    + "	[phone] = ?\n"
                    + "WHERE [email] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, fullname);
            pst.setString(2, phone);
            pst.setString(3, email);
            result = pst.executeUpdate();
        }
        return result;
    }

    //Search function
    public static ArrayList<Account> getAccounts(String name) throws Exception {
        ArrayList<Account> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [accID], [email], [password], [fullname], [phone], [status], [role]\n"
                    + "FROM [dbo].[Accounts]\n"
                    + "WHERE [fullname] LIKE ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + name + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int accid = rs.getInt("accID");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String fullname = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    int status = rs.getInt("status");
                    int role = rs.getInt("role");
                    Account acc = new Account(accid, email, password, fullname, phone, status, role);
                    list.add(acc);
                }
            }
            cn.close();
        }
        return list;
    }

    public static Account getAccountsByID(int id) throws Exception {
        Account acc = null;
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [accID], [email], [password], [fullname], [phone], [status], [role]\n"
                    + "FROM [dbo].[Accounts]\n"
                    + "WHERE [accID] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int accid = rs.getInt("accID");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String fullname = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    int status = rs.getInt("status");
                    int role = rs.getInt("role");
                    acc = new Account(accid, email, password, fullname, phone, status, role);
                }
            }
            cn.close();
        }
        return acc;
    }

    // Update status account
    public static void updateStatusAccount(String email, int status) throws Exception {
        //int result = 0;
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "UPDATE [dbo].[Accounts]\n"
                    + "SET [status] = ?\n"
                    + "WHERE [email] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, status);
            pst.setString(2, email);
            pst.executeUpdate();
            cn.close();
        }
        //return result;
    }
}
