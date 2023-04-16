<%-- 
    Document   : UserOrderDetail
    Created on : Mar 2, 2023, 7:35:14 PM
    Author     : Admin
--%>

<%@page import="sample.dto.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dto.OrderDetail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="grid.css" />
        <link rel="stylesheet" href="app.css" />
    </head>
    <body>
        <header>
            <%@include file="header_loginedAdmin.jsp" %>
        </header>
        <section>
            <!--<h3><a href="MainController?action=ViewUserOrder">View this user's order</a></h3>-->
        </section>
        <section class="user"> 
            <div class="grid wide"> 
                <div class="row user-container"> 
                    <div class="col l-12"> 
                        <div class="admin-content"> 
                            <%
                                ArrayList<OrderDetail> list = (ArrayList) request.getAttribute("userOrderDetail");
                                Account acc = (Account) request.getAttribute("acc");
                                String status = (String) request.getAttribute("status");
                                int money = 0;
                                int orderid = 0;
                                if (list != null && list.size() > 0) {
                            %>
                            <table class="plant">
                                <tr>
                                    <th>ID</th>
                                    <th>Image</th>
                                    <th>Plant ID</th>
                                    <th>Plant Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                </tr>
                                <%
                                    for (OrderDetail detail : list) {
                                %>
                                <tr>
                                    <td><%= detail.getOrderID()%></td>
                                    <td><img src="<%= detail.getImgPath()%>" class="" ></td>
                                    <td><%= detail.getPlantID()%></td>
                                    <td><%= detail.getPlantName()%></td>
                                    <td><%= detail.getPrice()%></td>
                                    <td><%= detail.getQuantity()%></td>
                                    <% money = money + detail.getPrice() * detail.getQuantity();
                                        orderid = detail.getOrderID();
                                    %>
                                </tr>
                                <%}%>
                            </table>
                            <% }%>
                            <h3>User information: </h3>
                            <p>Name: <%= acc.getFullname()%></p>
                            <p>Phone: <%= acc.getPhone()%></p>
                            <p>Email: <%= acc.getEmail()%></p>
                            <h3>Order information: </h3>
                            <p>Total money: <%= money%></p>
                            <%
                                if (status.equals("1")) {
                            %>
                            <form action="MainController" method="post">
<!--                                <p><input type="hidden" value="<%= acc.getFullname()%>" name="email"></p>
                                <p><input type="hidden" value="<%= acc.getPhone()%>" name="userName"></p>-->
                                <p><input type="hidden" value="<%= orderid%>" name="orderid"></p>
                                <p><input type="hidden" value="<%= acc.getEmail()%>" name="email"></p>
                                <p><input type="hidden" value="<%= acc.getFullname()%>" name="name"></p>
                                <p><input type="submit" value="ConfirmOrder" name="action" class="primary-button"></p>
                            </form>
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
