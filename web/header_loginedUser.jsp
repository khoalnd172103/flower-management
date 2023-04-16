<%-- 
    Document   : header_loginedUser
    Created on : Feb 14, 2023, 9:22:34 AM
    Author     : Admin
--%>

<%@page import="sample.dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="app.css" />
    </head>
    <body>
        <div class="wrapper">
            <header class="header">
                <div class="header-container">
                    <a href="index.jsp"><h1><span>Flower</span> Shop</h1></a>
                    <ul class="menu">
                        <li class="menu-item">
                            <a href="index.jsp" class="menu-link">Home</a>
                        </li>
                        <li class="menu-item">
                            <a href="shop.jsp" class="menu-link">Shop</a>
                        </li>
                        <li class="menu-item">
                            <a href="#" class="menu-link">Blog</a>
                        </li>
                        <li class="menu-item">
                            <a href="#" class="menu-link">About</a>
                        </li>
                    </ul>
                    <%
                        if (session.getAttribute("LoginAcc") != null) {
                    %>
                    <div class="header-account">
                        <a href="user.jsp"><img src="images/user-logo.svg"></a>
                        <a href="ViewCart.jsp"><img src="images/cart-logo.svg"></a>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="header-auth">
                        <a href="register.jsp" class="header-register">Register</a>
                        <a href="login.jsp" class="header-login">Login</a>
                        <%
                            }
                        %>
                    </div>
                </div>
            </header>
        </div>

        <!--        <nav>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="profile.jsp">Change profile</a></li>
                        <li><a href="view.jsp?status=2">Completed orders</a></li>
                        <li><a href="view.jsp?status=3">Canceled orders</a></li>
                        <li><a href="view.jsp?status=1">Processing orders</a></li>
                        <li>
                            From
                            <input type="date" name="from">
                            To
                            <input type="date" name="to">
                            <input type="submit" value="search">
                        </li>
                    </ul>
                </nav>-->
    </body>
</html>
