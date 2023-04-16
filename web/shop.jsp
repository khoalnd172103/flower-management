<%-- 
    Document   : shop
    Created on : Mar 3, 2023, 8:48:13 AM
    Author     : Admin
--%>

<%@page import="sample.dto.Category"%>
<%@page import="sample.dao.CategoryDAO"%>
<%@page import="sample.dao.PlantDAO"%>
<%@page import="sample.dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flower shop - Shop</title>
        <link rel="stylesheet" href="app.css" />
        <link rel="stylesheet" href="grid.css" />
    </head>
    <body>
        <div class="wrapper">
            <%
                if (session.getAttribute("LoginAcc") == null) {
            %>
            <header>
                <%@include file="header.jsp" %>
            </header>
            <%        } else {
            %>
            <header>
                <%@include file="header_loginedUser.jsp" %>
            </header>
            <%                }
            %>
            <main>
                <section class="search">
                    <div class="grid wide">
                        <div class="row search-wrapper">
                            <div class="search-container">
                                <form action="MainController" method="get" class="search-form">
                                    <input type="text" name="txtsearch" value="<%= (request.getAttribute("keyword") != null) ? request.getAttribute("keyword") : ""%>">
                                    <input type="submit" value="Search" name="action" >
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="shop">
                    <div class="grid wide">
                        <ul class="row shop-category-menu">
                            <%
                                ArrayList<Category> listCate = CategoryDAO.getCategories();
                                if (listCate != null && listCate.size() > 0) {
                                    for (Category cate : listCate) {

                            %>
                            <li class="col l-2 shop-category-item">
                                <a href="MainController?action=SearchByCate&cateName=<%= cate.getCateName()%>"><%= cate.getCateName()%></a>
                            </li>
                            <%                                                }
                                }
                            %>
                        </ul>
                        <div class="row">
                            <%
                                ArrayList<Plant> listPlantByCate = (ArrayList) request.getAttribute("listPlantByCate");
                                if (listPlantByCate != null && listPlantByCate.size() > 0) {
                                    for (Plant p : listPlantByCate) {
                            %>
                            <div class="col l-3">
                                <div class="shop-item">
                                    <div class="shop-image">
                                        <a href="plant.jsp?pid=<%= p.getId()%>">
                                            <img srcset="<%=p.getImgpath()%>">
                                        </a>
                                    </div>
                                    <h3 class="shop-name"><%= p.getName()%></h3>
                                    <div class="shop-detail">
                                        <p class="shop-price"><%= p.getPrice()%></p>
                                        <div class="shop-cart">
                                            <img class="shop-icon" srcset="images/cart.png 2x">
                                            <a href="MainController?action=addtocart&pid=<%= p.getId()%>" class="shop-action">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% }
                                }
                            %>
                        </div>
                        <div class="row">
                            <%
                                String keyword = request.getParameter("txtsearch");
                                ArrayList<Plant> list;
                                String[] tmp = {"Out of stock", "Available"};
                                if (keyword == null) {
                                    list = PlantDAO.getPlants("");
                                } else {
                                    list = PlantDAO.getPlants(keyword);
                                }
                                if (listPlantByCate == null && list != null && list.size() > 0) {
                                    for (Plant p : list) {
                            %>
                            <div class="col l-3">
                                <div class="shop-item">
                                    <div class="shop-image">
                                        <a href="plant.jsp?pid=<%= p.getId()%>">
                                            <img srcset="<%=p.getImgpath()%>">
                                        </a>
                                    </div>
                                    <h3 class="shop-name"><%= p.getName()%></h3>
                                    <div class="shop-detail">
                                        <p class="shop-price"><%= p.getPrice()%></p>
                                        <%
                                            if (p.getStatus() == 1) {
                                        %>
                                        <div class="shop-cart">
                                            <img class="shop-icon" srcset="images/cart.png 2x">
                                            <a href="MainController?action=addtocart&pid=<%= p.getId()%>" class="shop-action">Add to cart</a>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                            <% }
                            } else if(list == null || list.size() == 0 || listPlantByCate.size() == 0){
                            %>
                            <div class="col l-12">
                                <div class="shop-item">
                                    <h3 class="error">Plant not found</h3>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </body>
</html>
