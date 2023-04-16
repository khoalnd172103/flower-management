<%-- 
    Document   : register
    Created on : Feb 10, 2023, 4:20:24 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flower shop - Register</title>
        <link rel="stylesheet" href="app.css" />
    </head>
    <body>
        <div class="register">
            <div class="register-container">
                <div class="register-content">
                    <div class="register-header">
                        <h1>Register</h1>
                        <div class="register-back">
                            <img src="./images/house-logo.svg">
                            <a href="index.jsp">Back to home</a>
                        </div>
                    </div>
                    <p class="register-desc">Register and help us help you
                    </p>
                    <form action="MainController" method="post" class="register-form">
                        <p><input type="text" name="txtemail" required="" placeholder="Email" value="<%= (request.getAttribute("txtemail") == null) ? "" : request.getAttribute("txtemail")%>"></p>
                        <p><input type="text" name="txtname" required="" placeholder="Name" value="<%= (request.getAttribute("txtfullname") == null) ? "" : request.getAttribute("txtfullname")%>"></p>
                        <p><input type="password" name="txtpassword" required="" placeholder="Password"></p>
                        <p><input type="text" name="txtphone" required="" placeholder="Phone" 
                                  value="<%= (request.getAttribute("txtphone") == null) ? "" : request.getAttribute("txtphone")%>">
                        </p>
                        <div class="error">
                            <p><%= (request.getAttribute("ERROR") == null) ? "" : request.getAttribute("ERROR")%></p>
                            <p><%= (request.getAttribute("exist") == null) ? "" : request.getAttribute("exist")%></p>
                        </div>
                        <p class="register-privacy">With registering your accepting our terms and privacy policy</p>
                        <p class="register-button"><input type="submit" value="Create" name="action" ></p>
                    </form>
                    <p class="register-switch">
                        Already have an account? <a href="login.jsp">Login</a>
                    </p>
                </div>
                <div class="register-image">
                    <img srcset="./images/register.png 2x">
                </div>
            </div>
        </div>
    </body>
</html>
