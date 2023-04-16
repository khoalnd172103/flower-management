<%-- 
    Document   : EditCateProduct
    Created on : Feb 20, 2023, 4:29:32 PM
    Author     : Admin
--%>

<%@page import="sample.dto.Category"%>
<%@page import="sample.dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage category - Update category</title>
        <link rel="stylesheet" href="grid.css" />
        <link rel="stylesheet" href="app.css" />
    </head>
    <body>
        <header>
            <%@include file="header_loginedAdmin.jsp" %>
        </header>
        <section class="user"> 
            <div class="grid wide"> 
                <div class="row user-container"> 
                    <div class="col l-12"> 
                        <div class="admin-content">
                            <h3 class="admin-heading"><a href="ManageCategory.jsp">View all categories</a></h3>
                            <form action="MainController" method="post" class="admin-category">
                                <% String cateID = request.getParameter("cateID");%>
                                <input type="hidden" name="cid" value="<%= cateID%>">
                                <div class="admin-category-desc">
                                    <p>Category name: </p>
                                    <% String cateName = request.getParameter("cateName");%>
                                    <input type="text" name="txtCateName" value="<%= cateName%>" required="">
                                </div>
                                <input type="submit" value="Save Category" name="action" class="primary-button">
                            </form>
                        </div>
                    </div> 
                </div> 
            </div> 
        </section>
    </body>
</html>
