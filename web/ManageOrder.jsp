<%-- 
    Document   : ManageOrder
    Created on : Mar 1, 2023, 2:30:49 PM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="sample.dto.Account"%>
<%@page import="sample.dao.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard - Manage order</title>
        <!--<link  rel="stylesheet" href="mycss.css" type="text/css" />-->
        <link rel="stylesheet" href="grid.css" />
        <link rel="stylesheet" href="app.css" />
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp"/>
        <section class="user">
            <div class="grid wide">
                <div class="row user-container">
                    <div class="col l-12">
                        <div class="admin-content">
                            <h3 class="admin-heading">Manage order</h3>
                            <form action="MainController" method="post" class="admin-sort-order">
                                <p class="">Sort order(s) by: </p>
                                <select name="searchOrderBy">
                                    <option value="user">User</option>
                                    <option value="order">Order</option>
                                </select>
                                <input type="submit" name="action" value="Sort" class="admin-sort-button primary-button">
                            </form>
                            <c:set var="listAcc" value="${requestScope.listAccount}"></c:set>
                            <c:set var="listOrder" value="${requestScope.listOrder}"></c:set>
                            <c:if test="${listOrder == null && listAcc != null && listAcc.size() > 0}">
                                <table class="">
                                    <tr>
                                        <th>ID</th>
                                        <th>Email</th>
                                        <th>Full name</th>
                                        <th>Phone</th>
                                        <th>View</th>
                                    </tr>
                                    <c:forEach var="acc" items="${listAcc}">
                                        <tr>
                                            <td>${acc.accid}</td>
                                            <td>${acc.email}</td>
                                            <td>${acc.fullname}</td>
                                            <td>${acc.phone}</td>
                                            <td><a href="MainController?action=ViewUserOrder&email=${acc.email}&name=${acc.fullname}">View</a></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </c:if>
                            <c:if test="${listOrder != null && listAcc == null && listOrder.size() > 0}">
                                <table class="">
                                    <tr>
                                        <th>ID</th>
                                        <th>Order date</th>
                                        <th>Ship date</th>
                                        <th>Status</th>
                                        <th>Acc ID</th>
                                        <th>View detail</th>
                                    </tr>
                                    <c:forEach var="order" items="${listOrder}">
                                        <tr>
                                            <td>${order.orderid}</td>
                                            <td>${order.orderdate}</td>
                                            <td>${order.shipdate}</td>
                                            <td>${order.status}</td>
                                            <td>${order.accid}</td>
                                            <td>
                                                <a href="MainController?action=ViewUserOrderDetail&orderid=${order.orderid}&accid=${order.accid}&orderstatus=${order.status}">Detail</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
