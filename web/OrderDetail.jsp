<%-- 
    Document   : OrderDetail
    Created on : Feb 14, 2023, 10:38:37 AM
    Author     : Admin
--%>

<%@page import="sample.dto.Order"%>
<%@page import="sample.dto.Account"%>
<%@page import="sample.dto.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dao.OrderDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Order</title>
        <link rel="stylesheet" href="grid.css" />
        <link rel="stylesheet" href="app.css" />
    </head>
    <body>
        <%
            Account acc = (Account) session.getAttribute("LoginAcc");
            String name = (String) session.getAttribute("name");
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
                            <h3 class="mark">You must login to view your orders</h3>
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
        <section class="cart">
            <div class="grid wide">
                <div class="row">
                    <div class="col l-7">
                        <div class="cart-container">
                            <!--<h3 class="order_detail-id">Order ID: 33</h3>-->
                            <%                                int money = 0;
                                int orderID = 0;
                                ArrayList<OrderDetail> list = (ArrayList) request.getAttribute("orderDetail");
                                Order order = (Order) request.getAttribute("order");
                                if (list != null && list.size() > 0) {
                                    //int money = 0;
                                    for (OrderDetail detail : list) {

                            %>
                            <div class="row cart-detail">
                                <div class="col l-4">
                                    <div class="cart-image">
                                        <img srcset="<%= detail.getImgPath()%>">
                                    </div>
                                </div>
                                <div class="col l-8">
                                    <div class="order_detail-content">
                                        <h4 class="order_detail-desc">Plant ID: <%= detail.getPlantID()%></h4>
                                        <h4 class="order_detail-desc">Plant name: <%= detail.getPlantName()%></h4>
                                        <h4 class="order_detail-desc">Price: <%= detail.getPrice()%></h4>
                                        <h4 class="order_detail-desc">Quantity: <%= detail.getQuantity()%></h4>
                                        <% money = money + detail.getPrice() * detail.getQuantity();%>
                                        <% orderID = detail.getOrderID();%>
                                    </div>
                                </div>
                            </div>
                            <%}
                                }%>
                        </div>
                    </div>

                    <div class="col l-5">
                        <div class="cart-order">
                            <p class="cart-total">Order ID: <%= orderID%></p>
                            <p class="cart-total">Total: <%= money%></p>
                            <p class="cart-order_date">Order date: <%= order.getOrderdate()%></p>
                            <p class="cart-ship_date">Ship date: <%= order.getShipdate()%></p>
                            <div class="order_detail-action">
                                <a href="UserOrder.jsp" class="cart-button primary-button">All orders</a>
                                <!--<a href="#" class="cart-button global-button">Save order</a>-->
                                <%
                                    if (order.getStatus() == 3) {
                                %>
                                <form action="MainController" method="post">
                                    <input type="hidden" name="orderid" value="<%= orderID%>">
                                    <input type="submit" name="action" value="OrderAgain" class="cart-button primary-button">
                                </form>
                                <%
                                } else if (order.getStatus() == 1) {
                                %>
                                <form action="MainController" method="post">
                                    <input type="hidden" name="orderid" value="<%= orderID%>">
                                    <input type="submit" name="action" value="CancelOrder" class="cart-button primary-button">
                                </form>   
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--        <section>
                    <h3>Welcome  come back</h3>
                    <h3><a href="MainController?action=Logout">Log out</a></h3>
                    <h3><a href="user.jsp">View all orders</a></h3>
                </section>-->

        <%}
        %>
    </body>
</html>
