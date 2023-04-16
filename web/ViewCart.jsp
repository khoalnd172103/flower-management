<%-- 
    Document   : ViewCart
    Created on : Feb 15, 2023, 1:54:42 PM
    Author     : Admin
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="sample.dto.Plant"%>
<%@page import="sample.dao.PlantDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My cart | Flower shop</title>
        <link rel="stylesheet" href="grid.css" />
        <link rel="stylesheet" href="app.css" />
    </head>
    <body>
        <%
            if (session.getAttribute("LoginAcc") == null) {
        %>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <%        } else {
        %>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <%            }
        %>
        <section class="cart">
            <div class="grid wide">
                <div class="row">
                    <div class="col l-7">
                        <div class="cart-container">
                            <h3 class="cart-heading">Your cart</h3>
                            <%                                int total = 0;
                                HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
                                if (cart != null && cart.size() > 0) {
                                    Set<String> pids = cart.keySet();
                                    for (String pid : pids) {
                                        // Get plant from db base on pid
                                        Plant p = PlantDAO.getPlant(new Integer(pid));
                                        int quantity = cart.get(pid);
                            %>
                            <div class="row cart-detail">
                                <div class="col l-4">
                                    <div class="cart-image">
                                        <a href="plant.jsp?pid=<%= pid%>"><img srcset="<%= p.getImgpath()%> 2x"></a>
                                    </div>
                                </div>
                                <div class="col l-8">
                                    <div class="cart-content">
                                        <h4 class="cart-name">Name: <%= p.getName()%></h4>
                                        <div class="cart-action">
                                            <h4 class="cart-price">
                                                Price: <%= p.getPrice()%> / each
                                            </h4>
                                            <div class="cart-cart">
                                                <form action="MainController" method="post">
                                                    <input type="hidden" value="<%= pid%>" name="itemid">
                                                    <input type="number" value="<%= quantity%>" name="quantity" min="1" max="100" class="global-input">
                                                    <div class="cart-submit">
                                                        <input type="submit" value="Update" name="action" class="primary-button">
                                                        <input type="submit" value="Delete" name="action" class="primary-button">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%  total = total + p.getPrice() * cart.get(pid);
                                }
                            } else {
                            %>
                            <!-- No cart -->
                            <div class="grid wide">
                                <div class="row no-cart-container">
                                    <img srcset="images/no-cart.png 2x">
                                </div>
                            </div>
                            <%}%>                      
                        </div>
                    </div>

                    <div class="col l-5">
                        <div class="cart-order">
                            <p class="cart-total">Total: <%= total%></p>
                            <!--<p class="cart-order_date">Order date: <%= (new Date(System.currentTimeMillis())).toString()%></p>-->
                            <%
                                LocalDate orderDate = LocalDate.now();
                                LocalDate deliveryDate = orderDate.plusDays(2);
                            %>
                            <p class="cart-order_date">Order date: <%= orderDate%></p>
                            <p class="cart-ship_date">Ship date (Expected 2 days later): <%= deliveryDate%></p>
                            <div class="cart-save">
                                <!--<a href="#" class="cart-button global-button">Save order</a>-->
                                <form action="MainController" method="post" class="cart-save">
                                    <input type="submit" value="SaveOrder" name="action" class="primary-button">
                                    <%
                                        if (request.getAttribute("WARNING") != null && session.getAttribute("LoginAcc") == null) {
                                    %>
                                    <a href="login.jsp" class="primary-button">Login</a>
                                    <%}
                                    %>
                                </form>
                            </div>
                            <%
                                if (request.getAttribute("WARNING") != null && session.getAttribute("LoginAcc") == null) {
                            %>
                            <h3 class="error"><%= request.getAttribute("WARNING")%></h3>
                            <%
                            } else if (request.getAttribute("WARNING") != null && session.getAttribute("LoginAcc") != null) {
                            %>
                            <h3 class="error"><%= request.getAttribute("WARNING")%></h3>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
