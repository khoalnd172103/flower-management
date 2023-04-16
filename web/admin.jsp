<%-- 
    Document   : admin
    Created on : Feb 11, 2023, 5:37:57 PM
    Author     : Admin
--%>

<%@page import="sample.dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="k"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link rel="stylesheet" href="grid.css" />
        <link rel="stylesheet" href="app.css" />
    </head>
    <body>
        <k:import url="header_loginedAdmin.jsp"></k:import>
        <section class="user">
            <div class="grid wide">
                <div class="row user-container">
                    <div class="col l-12">
                        <div class="admin-content">
                            <h3 class="admin-heading">Welcome ${sessionScope.name}</h3>
                            <div class="admin-thumbnail">
                                <img srcset="images/admin-home.png 2x">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
<!--        <section class="right">
            <img src="images/background.jpg" style="max-width: 100%" height="100%">
        </section>-->
    </body>
</html>
