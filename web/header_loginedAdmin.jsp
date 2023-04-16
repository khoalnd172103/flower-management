<%-- 
    Document   : header_loginedAdmin
    Created on : Feb 18, 2023, 8:07:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--<link  rel="stylesheet" href="mycss.css" type="text/css" />-->
        <link rel="stylesheet" href="grid.css" />
        <link rel="stylesheet" href="app.css" />
    </head>
    <body>
        <header class="header">
            <div class="header-container">
                <a href="#">
                    <h1><span>Flower</span> Shop</h1>
                </a>
                <ul class="menu">
                    <li class="menu-item">
                        <a href="admin.jsp" class="menu-link">Home</a>
                    </li>
                    <li class="menu-item header-selection">
                        <a href="admin.jsp" class="menu-link">Manage menu</a>
                        <ul class="header-option">
                            <li class="header-option-item">
                                <a href="MainController?action=ManageAccounts" class="header-option-link">account</a>
                            </li>
                            <li class="header-option-item">
                                <a href="ManagePlant.jsp" class="header-option-link">plant</a>
                            </li>
                            <li class="header-option-item">
                                <a href="ManageCategory.jsp" class="header-option-link">category</a>
                            </li>
                            <li class="header-option-item">
                                <a href="ManageOrder.jsp" class="header-option-link">order</a>
                            </li>
                        </ul>
                    </li>
                    <li class="menu-item">
                        <a href="MainController?action=Logout" class="menu-link">Log out</a>
                    </li>
                </ul>
            </div>
        </header>
        <!--        <header>
                    <ul>
                        <li><a href="admin.jsp">Home</a></li>
                        <li><a href="MainController?action=ManageAccounts">Manage accounts</a></li>
                        <li><a href="MainController?action=ManageOrders">Manage orders</a></li>
                        <li><a href="ManagePlant.jsp">Manage plants</a></li>
                        <li><a href="ManageCategory.jsp">Manage categories</a></li>
                        <li>Welcome ${sessionScope.name} | <a href="MainController?action=Logout">Logout</a></li>
                    </ul>
                </header>-->
    </body>
</html>
