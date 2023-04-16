<%-- 
    Document   : view
    Created on : Feb 14, 2023, 7:23:52 PM
    Author     : Admin
--%>
<%@page import="sample.dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dao.OrderDao"%>
<%@page import="sample.dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My account - Order | Flower shop</title>
        <link rel="stylesheet" href="grid.css" />
    </head>
    <body>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <!--<h3><a href="UserOrder.jsp">View all orders</a></h3>-->
        <%            
            String name = ((Account) session.getAttribute("LoginAcc")).getFullname();
            String email = (String) session.getAttribute("email");
            String statusName = request.getParameter("status");
        %>
        <section class="user">
            <div class="grid wide">
                <div class="row user-container">
                    <div class="col l-3">
                        <div class="user-nav">
                            <div class="user-header">
                                <div class="user-avatar">
                                    <img srcset="images/user-avatar.png 2x">
                                </div>
                                <div class="user-title">
                                    <h4 class="user-name"><%= name%></h4>
                                    <a href="MainController?action=Logout">Log out</a>
                                </div>
                            </div>
                            <ul class="user-menu">
                                <a href="user.jsp" class="user-link">
                                    <img src="images/dashboard.svg">
                                    <li class="user-menu-item">Dashboard</li>
                                </a>
                                <a href="profile.jsp" class="user-link">
                                    <img src="images/info.svg">
                                    <li class="user-menu-item">My information</li>
                                </a>
                                <a href="UserOrder.jsp" class="user-link">
                                    <img src="images/order.svg">
                                    <li class="user-menu-item active">My order</li>
                                </a>
                            </ul>
                        </div>
                    </div>
                    <div class="col l-9">
                        <h3 class="order-heading">Your orders</h3>
                        <ul class="order-status-list">
                            <a href="UserOrder.jsp">
                                <li class="order-status">All</li>
                            </a>
                            <a href="view.jsp?status=1">
                                <li class="order-status <%= (statusName.equals("1")) ? "active" : ""%>">In progress</li>
                            </a>
                            <a href="view.jsp?status=3">
                                <li class="order-status <%= (statusName.equals("3")) ? "active" : ""%>">Canceled</li>
                            </a>
                            <a href="view.jsp?status=2">
                                <li class="order-status <%= (statusName.equals("2")) ? "active" : ""%>">Completed</li>
                            </a>
                        </ul>
                        <%
                            ArrayList<Order> list = OrderDao.getOrders(email, new Integer(statusName));
                            String[] status = {"", "processing", "completed", "canceled"};
                            if (list != null && list.size() > 0) {
                                for (Order ord : list) {

                        %>
                        <div class="order-detail">
                            <ul class="order-list no-outline">
                                <li class="order-info">
                                    <p class="order-desc">Order ID</p>
                                    <span><%= ord.getOrderid()%></span>
                                </li>
                                <li class="order-info">
                                    <p class="order-desc">Order Date</p>
                                    <span><%= ord.getOrderdate()%></span>
                                </li>
                                <li class="order-info">
                                    <p class="order-desc">Ship Date</p>
                                    <span><%= ord.getShipdate()%></span>
                                </li>
                                <li class="order-info">
                                    <p class="order-desc">Status</p>
                                    <span><%= status[ord.getStatus()]%></span>
                                </li>
                            </ul>
                            <div class="order-more">
                                <a href="ViewPlantServlet?orderid=<%= ord.getOrderid()%>">Detail</a>
                            </div>
                        </div>
                        <%                    }
                        } else {
                        %>
                        <h3 class="active">You don't have any order in <%= status[new Integer(statusName)]%></h3>
                        <%}%>  
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
