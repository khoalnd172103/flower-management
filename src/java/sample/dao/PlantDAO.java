/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.io.InputStream;
import sample.dto.Plant;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import sample.utils.MyConnection;
//import sample.dto.Plant;
//import sample.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class PlantDAO {

    public static ArrayList<Plant> getPlantsByCate(String cateName) throws Exception {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [PID], [PName], [price], [imgPath], [description], [status], Plants.[CateID] as 'CateID', CateName\n"
                    + "FROM Plants\n"
                    + "JOIN Categories\n"
                    + "ON Plants.CateID = Categories.CateID\n"
                    + "WHERE Categories.CateName = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, cateName);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgpath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateid = rs.getInt("CateID");
                    String catename = rs.getString("CateName");
                    Plant plant = new Plant(id, name, price, imgpath, description, status, cateid, catename);
                    list.add(plant);
                }
            }
            cn.close();
        }
        return list;
    }

    // Insert plant function
    public static int insertPlant(String name, int price, String imgpath, String desc, int status, String cateid) throws Exception {
        int result = 0;
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [CateID]\n"
                    + "FROM [dbo].[Categories]\n"
                    + "WHERE [CateName] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, cateid);
            ResultSet rs = pst.executeQuery();
            int cateID = 0;
            if (rs != null && rs.next()) {
                cateID = rs.getInt("CateID");
            }
            sql = "INSERT [dbo].[Plants]([PName], [price], [imgPath], [description], [status],[CateID])\n"
                    + "VALUES (?,?,?,?,?,?)";
            pst = cn.prepareStatement(sql);
            pst.setString(1, name);
            pst.setInt(2, price);
            pst.setString(3, imgpath);
            pst.setString(4, desc);
            pst.setInt(5, status);
            pst.setInt(6, cateID);
            result = pst.executeUpdate();
            cn.close();
        }
        return result;
    }

    // Update function
    public static void upatePlant(String plantName, int price, int status, String plantDesc, String cateid, int pid) throws Exception {
        //int result = 0;
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            int cateID = 0;
            String sql = "SELECT [CateID]\n"
                    + "FROM [dbo].[Categories]\n"
                    + "WHERE [CateName] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, cateid);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                cateID = rs.getInt("CateID");
            }
            sql = "UPDATE [dbo].[Plants]\n"
                    + "SET [PName] = ?,\n"
                    + "[price] = ?,\n"
                    + "[status] = ?,\n"
                    + "[description] = ?,\n"
                    + "[CateID] = ?\n"
                    + "WHERE [PID] = ?";
            pst = cn.prepareStatement(sql);
            pst.setString(1, plantName);
            pst.setInt(2, price);
            pst.setInt(3, status);
            pst.setString(4, plantDesc);
            pst.setInt(5, cateID);
            pst.setInt(6, pid);
            pst.executeUpdate();
            cn.close();
        }
        //return result;
    }

    // Search function
    public static ArrayList<Plant> getPlants(String keyword) throws Exception {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [PID], [PName], [price], [imgPath], [description], [status], Plants.[CateID] as 'CateID', CateName\n"
                    + "FROM Plants\n"
                    + "JOIN Categories\n"
                    + "ON Plants.CateID = Categories.CateID\n"
                    + "WHERE Plants.PName like ?";
//                if (searchby.equalsIgnoreCase("byname")) {
//                    sql = sql + "WHERE Plants.PName like ?";
//                } else {
//                    sql = sql + "WHERE CateName like ?";
//                }
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + keyword + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgpath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateid = rs.getInt("CateID");
                    String catename = rs.getString("CateName");
                    Plant plant = new Plant(id, name, price, imgpath, description, status, cateid, catename);
                    list.add(plant);
                }
            }
            cn.close();
        }
        return list;
    }

    //Get all plants
    public static ArrayList<Plant> getPlants() throws Exception {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [PID], [PName], [price], [imgPath], [description], [status], Plants.[CateID] as 'CateID', CateName\n"
                    + "FROM Plants\n"
                    + "JOIN Categories\n"
                    + "ON Plants.CateID = Categories.CateID\n";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgpath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateid = rs.getInt("CateID");
                    String catename = rs.getString("CateName");
                    Plant plant = new Plant(id, name, price, imgpath, description, status, cateid, catename);
                    list.add(plant);
                }
            }
            cn.close();
        }
        return list;
    }

    public static Plant getPlant(int id) throws Exception {
        Plant p = null;
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [PID], [PName], [price], [imgPath], [description], [status],\n"
                    + "[dbo].[Plants].CateID as CateID, [CateName]\n"
                    + "FROM [dbo].[Plants]\n"
                    + "JOIN [dbo].[Categories]\n"
                    + "ON [dbo].[Plants].CateID = [dbo].[Categories].CateID\n"
                    + "WHERE [PID] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int plantid = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgpath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateid = rs.getInt("CateID");
                    String cateName = rs.getString("CateName");
                    p = new Plant(plantid, name, price, imgpath, description, status, cateid, cateName);
                }
            }
            cn.close();
        }
        return p;
    }
}
