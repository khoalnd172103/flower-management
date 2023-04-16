<%-- 
    Document   : UserOrder
    Created on : Mar 3, 2023, 8:25:27 PM
    Author     : Admin
--%>

<%@page import="sample.dto.Order"%>
<%@page import="sample.dao.OrderDao"%>
<%@page import="java.util.ArrayList"%>
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
        <%
            String email = (String) session.getAttribute("email");
            String name = (String) session.getAttribute("name");
            Cookie[] c = request.getCookies();
            if (name == null) {

        %>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <main>
            <section class="user">
                <div class="grid wide">
                    <div class="row user-container">
                        <div class="user-check-auth">
                            <h3>You must login to view personal page</h3>
                            <a href="login.jsp" class="primary-button">Login</a>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <%        } else {
        %>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
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
                                <li class="order-status active">All</li>
                            </a>
                            <a href="view.jsp?status=1">
                                <li class="order-status">In progress</li>
                            </a>
                            <a href="view.jsp?status=3">
                                <li class="order-status">Canceled</li>
                            </a>
                            <a href="view.jsp?status=2">
                                <li class="order-status">Completed</li>
                            </a>
                        </ul>
                        <form method="post" action="MainController" class="order-search-by-date">
                            <input type="hidden" name="email" value="<%= email%>">
                            <label for="start_date">Start Date:</label>
                            <input type="date" id="start_date" name="start_date">

                            <label for="end_date">End Date:</label>
                            <input type="date" id="end_date" name="end_date">

                            <input type="submit" value="Submit" name="action" class="primary-button">
                        </form>
                        <p class="error"><%= (request.getAttribute("error") != null) ? request.getAttribute("error") : ""%></p>
                        <%
                            ArrayList<Order> listOrderByDate = (ArrayList) request.getAttribute("listOrderByDate");
                            String[] status = {"", "processing", "completed", "canceled"};
                            if (listOrderByDate != null && listOrderByDate.size() > 0) {
                                for (Order ord : listOrderByDate) {
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
                        <%
                                }
                            }
                        %>

                        <%
                            ArrayList<Order> list = OrderDao.getOrders(email);
                            if (listOrderByDate == null && list != null && list.size() > 0) {
                                for (Order o : list) {

                        %>
                        <div class="order-detail">
                            <ul class="order-list no-outline">
                                <li class="order-info">
                                    <p class="order-desc">Order ID</p>
                                    <span><%= o.getOrderid()%></span>
                                </li>
                                <li class="order-info">
                                    <p class="order-desc">Order Date</p>
                                    <span><%= o.getOrderdate()%></span>
                                </li>
                                <li class="order-info">
                                    <p class="order-desc">Ship Date</p>
                                    <span><%= o.getShipdate()%></span>
                                </li>
                                <li class="order-info">
                                    <p class="order-desc">Status</p>
                                    <span><%= status[o.getStatus()]%></span>
                                </li>
                            </ul>
                            <div class="order-more">
                                <a href="ViewPlantServlet?orderid=<%= o.getOrderid()%>">Detail</a>
                            </div>
                        </div>
                        <%                    }
                        } else if (listOrderByDate == null) {
                        %>
                        <h3>You don't have any order</h3>
                        <%}%>  
                    </div>
                </div>
            </div>
        </section>

        <%}
        %>

        <!--        <section>
                    <h3>Welcome  come back</h3>
                    <h3><a href="MainController?action=Logout">Log out</a></h3>
                    <h3><a href="ViewCart.jsp">View cart</a></h3>
                </section>-->
    </body>
</html>
