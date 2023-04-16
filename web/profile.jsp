<%-- 
    Document   : profile
    Created on : Feb 14, 2023, 3:58:16 PM
    Author     : Admin
--%>

<%@page import="sample.dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My account - Profile | Flower shop</title>
        <link rel="stylesheet" href="grid.css" />
    </head>
    <body>
        <div class="wrapper">

            <header>
                <%@include file="header_loginedUser.jsp" %>
            </header>
            <%                String email = ((Account) session.getAttribute("LoginAcc")).getEmail();
                String name = ((Account) session.getAttribute("LoginAcc")).getFullname();
                String phone = ((Account) session.getAttribute("LoginAcc")).getPhone();
                String pass = ((Account) session.getAttribute("LoginAcc")).getPassword();
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
                                        <li class="user-menu-item active">My information</li>
                                    </a>
                                    <a href="UserOrder.jsp" class="user-link">
                                        <img src="images/order.svg">
                                        <li class="user-menu-item">My order</li>
                                    </a>
                                </ul>
                            </div>
                        </div>
                        <div class="col l-9">
                            <h3 class="user-heading">Your information</h3>
                            <div class="user-info">
                                <div class="row">
                                    <div class="col l-4">
                                        <div class="user-upload-avatar">
                                            <img srcset="images/user-avatar-2.png 2x">
                                            <a href="#">Upload</a>
                                        </div>
                                    </div>
                                    <div class="col l-8">
                                        <div class="user-form">
                                            <form action="MainController" method="post">
                                                <input type="hidden" value="<%= email%>" name="email">
                                                <input type="hidden" value="<%= pass%>" name="pass">
                                                <h3 class="">Full name</h3>
                                                <p><input type="text" name="txtNameUpdate" value="<%= name%>" required=""></p>
                                                <h3 class="">Phone number</h3>
                                                <p><input type="text" name="txtPhoneUpdate" value="<%= phone%>" required=""></p>
                                                <p class="user-button "><input type="submit" value="Save" name="action"></p>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
