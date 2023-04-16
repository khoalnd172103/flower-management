<%-- 
    Document   : otp
    Created on : Feb 14, 2023, 8:41:09 AM
    Author     : Admin
--%>

<%@page import="sample.dto.Account"%>
<%@page import="sample.dao.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="app.css" />
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <main>
            <section class="user">
                <div class="grid wide">
                    <div class="row user-container">
                        <div class="user-check-auth">
                            <h3 class="mark">Please check your email: <%= (String) request.getAttribute("newAccountEmail")%> to get confirm code</h3>
                            <%
                                Account adminAcc = AccountDAO.getAccount("admin@gmail.com", "admin");
                                if (adminAcc != null) {

                            %>
                            <p>Contact us <%= adminAcc.getEmail()%> </p>
                            <%
                                }
                            %>
                            <a href="login.jsp" class="primary-button">Login</a>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </body>
</html>
