<%-- 
    Document   : header
    Created on : Feb 11, 2023, 5:26:01 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="app.css" />
    </head>
    <body>
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
                        <a href="ViewCart.jsp" class="menu-link">View Cart</a>
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

    </body>
</html>
