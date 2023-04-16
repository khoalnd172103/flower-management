/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import sample.dto.Category;
import sample.utils.MyConnection;

/**
 *
 * @author Admin
 */
public class CategoryDAO {

    // Get all categories
    public static ArrayList<Category> getCategories() throws Exception {
        ArrayList<Category> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [CateID], [CateName]\n"
                    + "FROM [dbo].[Categories]";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int cateid = rs.getInt("CateID");
                    String cateName = rs.getString("CateName");
                    Category cate = new Category(cateid, cateName);
                    list.add(cate);
                }
            }
            cn.close();
        }
        return list;
    }

    // Get category by id
    public static Category getCatetory(int cateid) throws Exception {
        Category c = null;
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [CateID], [CateName]\n"
                    + "FROM [dbo].[Categories]\n"
                    + "WHERE [CateID] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, cateid);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int cateID = rs.getInt("CateID");
                    String catename = rs.getString("CateName");
                    c = new Category(cateID, catename);
                }
            }
            cn.close();
        }
        return c;
    }

    // Update category
    public static void updateCate(String catename, int cateid) throws Exception {
        //int result = 0;
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "UPDATE [dbo].[Categories]\n"
                    + "SET [CateName] = ?\n"
                    + "WHERE [CateID] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, catename);
            pst.setInt(2, cateid);
            pst.executeUpdate();
            cn.close();
        }
        //return result;
    }

    // Insert category
    public static int insertCategory(String catename) throws Exception {
        int result = 0;
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "INSERT [dbo].[Categories]([CateName])\n"
                    + "VALUES (?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, catename);
            result = pst.executeUpdate();
            cn.close();
        }
        return result;
    }
}
