<%-- 
    Document   : user
    Created on : Feb 11, 2023, 7:48:06 PM
    Author     : Admin
--%>

<%@page import="sample.dto.OrderDetail"%>
<%@page import="sample.dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dao.OrderDao"%>
<%@page import="sample.dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My account - Home | Flower shop</title>
        <link rel="stylesheet" href="grid.css" />
        <link rel="stylesheet" href="app.css" />
    </head>
    <body>
        <%
            String email = (String) session.getAttribute("email");
            Account acc = (Account) session.getAttribute("LoginAcc");
            Cookie[] c = request.getCookies();
            if (acc.getFullname() == null) {

        %>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <main>
            <section class="user">
                <div class="grid wide">
                    <div class="row user-container">
                        <div class="user-check-auth">
                            <h3 class="mark">You must login to view personal page</h3>
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
        <main>
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
                                        <h4 class="user-name"><%= acc.getFullname()%></h4>
                                        <a href="MainController?action=Logout">Log out</a>
                                    </div>
                                </div>
                                <ul class="user-menu">
                                    <a href="user.jsp" class="user-link">
                                        <img src="images/dashboard.svg">
                                        <li class="user-menu-item active">Dashboard</li>
                                    </a>
                                    <a href="profile.jsp" class="user-link">
                                        <img src="images/info.svg">
                                        <li class="user-menu-item">My information</li>
                                    </a>
                                    <a href="UserOrder.jsp" class="user-link">
                                        <img src="images/order.svg">
                                        <li class="user-menu-item">My order</li>
                                    </a>
                                </ul>
                            </div>
                        </div>
                        <div class="col l-9">
                            <h3 class="user-heading">Dashboard</h3>
                            <div class="user-home-image">
                                <img srcset="images/user-home-1.png 2x">
                                <img srcset="images/user-home-2.png 2x">
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <%}
        %>
    </body>
</html>
