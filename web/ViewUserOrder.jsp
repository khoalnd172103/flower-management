<%-- 
    Document   : ViewUserOrder
    Created on : Mar 2, 2023, 3:55:28 PM
    Author     : Admin
--%>

<%@page import="sample.dto.Order"%>
<%@page import="sample.dao.OrderDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String userName = (String) request.getAttribute("userName");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View <%=userName%>'s order</title>
        <link rel="stylesheet" href="grid.css" />
        <link rel="stylesheet" href="app.css" />
    </head>
    <body>
        <header>
            <%@include file="header_loginedAdmin.jsp" %>
        </header>
        <section class="user">
            <div class="grid wide">
                <div class="row user-container">
                    <div class="col l-12">
                        <div class="admin-content">
                            <%
                                String email = (String) request.getAttribute("email");
                            %>
                            <h3 class="admin-heading"><a href="MainController?action=ManageOrders">View all user's order</a></h3>
                            <h3>You are viewing <%= userName%>'s order(s)</h3>
                            <%
                                ArrayList<Order> list = (ArrayList) request.getAttribute("listUserOrder");
                                String[] status = {"", "processing", "completed", "canceled"};
                                if (list != null && list.size() > 0) {
                            %>
                            <table>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Order Date</th>
                                    <th>Ship Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                <%
                                    for (Order ord : list) {
                                %>
                                <tr>
                                    <td><%= ord.getOrderid()%></td>
                                    <td><%= ord.getOrderdate()%></td>
                                    <td><%= ord.getShipdate()%></td>
                                    <td><%= status[ord.getStatus()]%></td>
                                    <td><a href="MainController?action=ViewUserOrderDetail&orderid=<%= ord.getOrderid()%>&accid=<%= ord.getAccid()%>&orderstatus=<%= ord.getStatus()%>">Detail</a></td>
                                </tr>
                                <%                    }
                                %>
                            </table>
                            <%                    }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
