/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import sample.dto.Order;
import sample.dto.OrderDetail;
import sample.utils.MyConnection;

/**
 *
 * @author Admin
 */
public class OrderDao {

    // Confirm order
    public static void confirmOrder(int orderid) throws Exception {
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "UPDATE [dbo].[Orders]\n"
                    + "SET [status] = 2\n"
                    + "WHERE [OrderID] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, orderid);
            pst.executeUpdate();
            cn.close();
        }
    }

    // Order again
    public static void orderAgain(int orderid) throws Exception {
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "UPDATE [dbo].[Orders]\n"
                    + "SET [status] = 1\n"
                    + "WHERE [OrderID] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, orderid);
            pst.executeUpdate();
            cn.close();
        }
    }

    // Cancel order
    public static void cancelOrder(int orderid) throws Exception {
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "UPDATE [dbo].[Orders]\n"
                    + "SET [status] = 3\n"
                    + "WHERE [OrderID] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, orderid);
            pst.executeUpdate();
            cn.close();
        }
    }

    public static ArrayList<Order> getOrders(String email, String startDate, String endDate) throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [OrderID], [OrdDate], [shipdate],\n"
                    + "[dbo].[Orders].[status] as 'status', [dbo].[Orders].[AccID] as 'AccID'\n"
                    + "FROM [dbo].[Orders]\n"
                    + "JOIN [dbo].[Accounts]\n"
                    + "ON [dbo].[Orders].AccID = [dbo].[Accounts].accID\n"
                    + "WHERE [dbo].Orders.OrdDate BETWEEN(?) AND (?) \n"
                    + "AND [dbo].[Accounts].email = ?\n"
                    + "ORDER BY [OrderID] DESC";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, startDate);
            pst.setString(2, endDate);
            pst.setString(3, email);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int orderid = rs.getInt("OrderID");
                    String orderdate = rs.getString("OrdDate");
                    String shipdate = rs.getString("shipdate");
                    int status = rs.getInt("status");
                    int accid = rs.getInt("AccID");
                    Order order = new Order(orderid, orderdate, shipdate, status, accid);
                    list.add(order);
                }
            }
            cn.close();
        }
        return list;
    }

    public static ArrayList<Order> getOrders(String email) throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [OrderID], [OrdDate], [shipdate], \n"
                    + "[dbo].[Orders].[status] as 'status', [dbo].[Orders].[AccID] as 'AccID'\n"
                    + "FROM [dbo].[Orders]\n"
                    + "JOIN [dbo].[Accounts]\n"
                    + "ON [dbo].[Orders].AccID = [dbo].[Accounts].accID\n"
                    + "WHERE [dbo].[Accounts].email = ? ORDER BY [OrderID] DESC";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int orderid = rs.getInt("OrderID");
                    String orderdate = rs.getString("OrdDate");
                    String shipdate = rs.getString("shipdate");
                    int status = rs.getInt("status");
                    int accid = rs.getInt("AccID");
                    Order order = new Order(orderid, orderdate, shipdate, status, accid);
                    list.add(order);
                }
            }
            cn.close();
        }
        return list;
    }
    
    public static ArrayList<Order> getOrders() throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [OrderID], [OrdDate], [shipdate], \n"
                    + "[dbo].[Orders].[status] as 'status', [dbo].[Orders].[AccID] as 'AccID'\n"
                    + "FROM [dbo].[Orders]\n"
                    + "JOIN [dbo].[Accounts]\n"
                    + "ON [dbo].[Orders].AccID = [dbo].[Accounts].accID\n"
                    + "ORDER BY [OrderID] DESC";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int orderid = rs.getInt("OrderID");
                    String orderdate = rs.getString("OrdDate");
                    String shipdate = rs.getString("shipdate");
                    int status = rs.getInt("status");
                    int accid = rs.getInt("AccID");
                    Order order = new Order(orderid, orderdate, shipdate, status, accid);
                    list.add(order);
                }
            }
            cn.close();
        }
        return list;
    }

    public static Order getOrder(int id) throws Exception {
        Order o = null;
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [OrderID], [OrdDate], [shipdate], [status], [AccID]\n"
                    + "FROM [dbo].[Orders]\n"
                    + "WHERE [OrderID] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int orderid = rs.getInt("OrderID");
                    String orderDate = rs.getString("OrdDate");
                    String shipDate = rs.getString("shipdate");
                    int status = rs.getInt("status");
                    int accid = rs.getInt("AccID");
                    o = new Order(orderid, orderDate, shipDate, status, accid);
                }
            }
            cn.close();
        }
        return o;
    }

    public static ArrayList<Order> getOrders(String email, int status) throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [OrderID], [OrdDate], [shipdate],\n"
                    + "[dbo].[Orders].[status] as 'status', [dbo].[Orders].[AccID] as 'AccID'\n"
                    + "FROM [dbo].[Orders]\n"
                    + "JOIN [dbo].[Accounts]\n"
                    + "ON [dbo].[Orders].AccID = [dbo].[Accounts].accID\n"
                    + "WHERE [dbo].[Accounts].email = ?\n"
                    + "AND [dbo].[Orders].[status] = ? ORDER BY [OrderID] DESC";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setInt(2, status);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int orderid = rs.getInt("OrderID");
                    String orderdate = rs.getString("OrdDate");
                    String shipdate = rs.getString("shipdate");
                    int accid = rs.getInt("AccID");
                    Order order = new Order(orderid, orderdate, shipdate, status, accid);
                    list.add(order);
                }
            }
            cn.close();
        }
        return list;
    }

    public static ArrayList<OrderDetail> getOrderDetail(int orderID) throws Exception {
        ArrayList<OrderDetail> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [DetailId], [OrderID], [PID] as 'PlantID', \n"
                    + "[dbo].[Plants].[PName], [dbo].[Plants].[price], [dbo].[Plants].imgPath, [dbo].[OrderDetails].quantity\n"
                    + "FROM [dbo].[OrderDetails]\n"
                    + "JOIN [dbo].[Plants]\n"
                    + "ON [dbo].[Plants].[PID] = [dbo].[OrderDetails].[FID]\n"
                    + "WHERE [OrderID] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, orderID);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int detailid = rs.getInt("DetailId");
                    int plantid = rs.getInt("PlantID");
                    String plantName = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    int quantity = rs.getInt("quantity");
                    OrderDetail orderdetail = new OrderDetail(detailid, orderID, plantid, plantName, price, imgPath, quantity);
                    list.add(orderdetail);
                }
            }
        }

        return list;
    }

    public static boolean insertOrder(String email, HashMap<String, Integer> cart) throws Exception {
        boolean result = false;
        Connection cn = MyConnection.makeConnection();
        LocalDate orderDate = LocalDate.now();
        LocalDate deliveryDate = orderDate.plusDays(2);
        Date orderdate = java.sql.Date.valueOf(orderDate);
        Date deliverydate = java.sql.Date.valueOf(deliveryDate);
        if (cn != null) {
            int accid = 0, orderid = 0;
            cn.setAutoCommit(false); // Turn off auto commit
            // Get accout id by email
            String sql = "SELECT [accID] FROM [dbo].[Accounts]\n"
                    + "WHERE [email] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                accid = rs.getInt("accID");
            }
            System.out.println("AccountID: " + accid);
            System.out.println("Order date: " + orderDate);
            sql = "INSERT [dbo].[Orders]([OrdDate], [shipdate], [status], [AccID])\n"
                    + "VALUES (?,?,?,?)";
            pst = cn.prepareStatement(sql);
            pst.setDate(1, orderdate);
            pst.setDate(2, deliverydate);
            pst.setInt(3, 1);
            pst.setInt(4, accid);
            pst.executeUpdate();
            // Get order id that is the lagest number
            sql = "SELECT TOP 1 [OrderID] FROM [dbo].[Orders] ORDER BY [OrderID] DESC";
            pst = cn.prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                orderid = rs.getInt("OrderID");
            }
            // Insert order details
            System.out.println("OrderID: " + orderid);
            Set<String> pids = cart.keySet();
            for (String pid : pids) {
                sql = "INSERT [dbo].[OrderDetails] VALUES (?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, orderid);
                pst.setInt(2, Integer.parseInt(pid.trim()));
                pst.setInt(3, cart.get(pid));
                pst.executeUpdate();
                cn.commit();
                cn.setAutoCommit(true);
            }
            return true;

        } else {
            System.out.println("An error occurs. Please try again");
        }
        return result;
    }
}
