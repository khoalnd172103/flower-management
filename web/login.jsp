<%-- 
    Document   : loginPage
    Created on : Feb 7, 2023, 3:47:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flower shop - Login</title>
        <link rel="stylesheet" href="app.css" />
    </head>
    <body>
        <div class="login">
            <div class="login-container">
                <div class="login-content">
                    <div class="login-header">
                        <h1>Login</h1>
                        <div class="login-back">
                            <img src="./images/house-logo.svg">
                            <a href="index.jsp">Back to home</a>
                        </div>
                    </div>
                    <p class="login-desc">Login and have more fun
                    </p>
                    <form action="MainController" method="post" class="login-form">
                        <p><input type="text" name="txtemail" placeholder="Email"></p>
                        <p><input type="password" name="txtpassword" placeholder="Password"></p>
                        <div class="error">
                            <p><%= (request.getAttribute("blocked") != null) ? request.getAttribute("blocked") : ""%></p>
                            <p><%= (request.getAttribute("error") != null) ? request.getAttribute("error") : ""%></p>
                        </div>
                        <div class="login-stayin">
                            <input type="checkbox" value="SaveLogIn" name="savalogin">
                            <p>Stayed signed in</p>
                        </div>
                        <p class="login-button"><input type="submit" value="LogIn" name="action" ></p>
                    </form>
                    <p class="login-switch">
                        Dont have an account? <a href="register.jsp">Register</a>
                    </p>
                </div>
                <div class="login-image">
                    <img srcset="./images/login.png 2x">
                </div>
            </div>
        </div>
    </body>
</html>
