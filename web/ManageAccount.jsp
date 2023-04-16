<%-- 
    Document   : MangeAccount
    Created on : Feb 19, 2023, 3:37:19 PM
    Author     : Admin
--%>

<%@page import="sample.dto.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dao.AccountDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard - Manage account</title>
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
                            <h3 class="admin-heading">Manage account</h3>
                            <div class="row search-wrapper">
                                <div class="search-container">
                                    <form action="MainController" method="post" class="search-form">
                                        <input type="text" name="txtSearch" value="${requestScope.keyword}">
                                        <input type="submit" value="SearchAccount" name="action">
                                    </form>
                                </div>
                            </div>
                            <c:set var="list" value="${requestScope.listAccount}"></c:set>
                            <c:if test="${list != null && list.size() == 0}">
                                <h3 class="error">User not found</h3>
                            </c:if>
                            <c:if test="${list != null && list.size() > 0}">
                                <table class="">
                                    <tr>
                                        <th>ID</th>
                                        <th>Email</th>
                                        <th>Full name</th>
                                        <th>Status</th>
                                        <th>Phone</th>
                                        <th>Role</th>
                                        <th>Action</th>
                                    </tr>
                                    <c:forEach var="acc" items="${list}">
                                        <tr>
                                            <td><c:out value="${acc.getAccid()}"></c:out></td>
                                            <td class="no-cap"><c:out value="${acc.getEmail()}"></c:out></td>
                                            <td><c:out value="${acc.getFullname()}"></c:out></td>
                                                <td>
                                                <c:choose>
                                                    <c:when test="${acc.getStatus() eq 1}">Active</c:when>
                                                    <c:otherwise>Inactive</c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td><c:out value="${acc.getPhone()}"></c:out></td>
                                                <td>
                                                <c:choose>
                                                    <c:when test="${acc.getRole() eq 1}">Admin</c:when>
                                                    <c:otherwise>User</c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:if test="${acc.getRole() eq 0}">
                                                    <c:url var="mylink" value="MainController">
                                                        <c:param name="email" value="${acc.getEmail()}"></c:param>
                                                        <c:param name="status" value="${acc.getStatus()}"></c:param>
                                                        <c:param name="action" value="UpdateStatusAccount"></c:param>
                                                    </c:url>
                                                    <a href="${mylink}">Block/Unblock</a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
