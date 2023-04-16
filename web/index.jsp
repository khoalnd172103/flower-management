<%-- 
    Document   : index
    Created on : Feb 11, 2023, 7:43:34 PM
    Author     : Admin
--%>

<%@page import="sample.dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dao.PlantDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flower Shop</title>
        <link rel="stylesheet" href="app.css" />
    </head>
    <body>
        <div class="wrapper">
            <%--<%@include file="header.jsp" %>--%>
            <%            ServletConfig servletConfig = getServletConfig();
                String language = servletConfig.getInitParameter("language");
            %>
            <%
                ServletContext context = getServletContext();
                String country = context.getInitParameter("countryName");
            %>
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
                <div class="app">
                    <section class="hero">
                        <div class="container">
                            <div class="hero-container">
                                <div class="hero-content">
                                    <h1 class="hero-heading">Flowers, 🌻
                                        what the world needs
                                    </h1>
                                    <p class="hero-desc">Browse between hounders of flowers
                                    </p>
                                    <a href="shop.jsp" class="primary-button">Browse</a>
                                </div>
                                <div class="hero-images">
                                    <div class="hero-images-line">
                                        <img srcset="images/hero-1.png 2x">
                                        <img srcset="images/hero-2.png 2x">
                                        <img srcset="images/hero-3.png 2x">
                                    </div>
                                    <div class="hero-images-line">
                                        <img srcset="images/hero-4.png 2x">
                                        <img srcset="images/hero-5.png 2x">
                                        <img srcset="images/hero-6.png 2x">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="best_seller">
                        <div class="container">
                            <div class="best_seller-container">
                                <h1 class="global-heading">Best seller</h1>
                                <div class="best_seller-list">
                                    <div class="best_seller-item">
                                        <div class="best_seller-image">
                                            <img srcset="images/shop-1.png 2x">
                                        </div>
                                        <h3 class="best_seller-name">Daisy</h3>
                                        <div class="best_seller-detail">
                                            <p class="best_seller-price">5$</p>
                                            <div class="best_seller-cart">
                                                <img class="best_seller-icon" srcset="images/cart.png 2x">
                                                <a href="#" class="best_seller-action">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="best_seller-item">
                                        <div class="best_seller-image">
                                            <img srcset="images/shop-2.png 2x">
                                        </div>
                                        <h3 class="best_seller-name">Sun flower</h3>
                                        <div class="best_seller-detail">
                                            <p class="best_seller-price">5$</p>
                                            <div class="best_seller-cart">
                                                <img class="best_seller-icon" srcset="images/cart.png 2x">
                                                <a href="#" class="best_seller-action">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="best_seller-item">
                                        <div class="best_seller-image">
                                            <img srcset="images/shop-3.png 2x">
                                        </div>
                                        <h3 class="best_seller-name">White Rose</h3>
                                        <div class="best_seller-detail">
                                            <p class="best_seller-price">5$</p>
                                            <div class="best_seller-cart">
                                                <img class="best_seller-icon" srcset="images/cart.png 2x">
                                                <a href="#" class="best_seller-action">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="best_seller-item">
                                        <div class="best_seller-image">
                                            <img srcset="images/shop-4.png 2x">
                                        </div>
                                        <h3 class="best_seller-name">Periwinkle</h3>
                                        <div class="best_seller-detail">
                                            <p class="best_seller-price">5$</p>
                                            <div class="best_seller-cart">
                                                <img class="best_seller-icon" srcset="images/cart.png 2x">
                                                <a href="#" class="best_seller-action">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="post">
                        <div class="container">
                            <div class="post-container">
                                <h1 class="global-heading">
                                    Latest posts
                                </h1>
                                <div class="post-list">
                                    <div class="post-item">
                                        <div class="post-header">
                                            <div class="post-user">
                                                <img srcset="images/user-ava.png 2x">
                                                <p class="post-user-name">Emily</p>
                                            </div>
                                            <p class="post-day">
                                                2023/28/02
                                            </p>
                                        </div>
                                        <div class="post-image">
                                            <img srcset="images/post-1.png 2x">
                                        </div>
                                        <div class="post-content">
                                            <div class="post-heading">
                                                Best flowers for inside home
                                            </div>
                                            <div class="post-desc">
                                                All the flowers are best for your lovly house
                                                just get the one you love the most 😊
                                            </div>
                                            <div class="post-more">
                                                <a href="#">Read more</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="post-item">
                                        <div class="post-header">
                                            <div class="post-user">
                                                <img srcset="images/user-ava.png 2x">
                                                <p class="post-user-name">Emily</p>
                                            </div>
                                            <p class="post-day">
                                                2023/28/02
                                            </p>
                                        </div>
                                        <div class="post-image">
                                            <img srcset="images/post-2.png 2x">
                                        </div>
                                        <div class="post-content">
                                            <div class="post-heading">
                                                Best flowers for inside home
                                            </div>
                                            <div class="post-desc">
                                                All the flowers are best for your lovly house
                                                just get the one you love the most 😊
                                            </div>
                                            <div class="post-more">
                                                <a href="#">Read more</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="post-item">
                                        <div class="post-header">
                                            <div class="post-user">
                                                <img srcset="images/user-ava.png 2x">
                                                <p class="post-user-name">Emily</p>
                                            </div>
                                            <p class="post-day">
                                                2023/28/02
                                            </p>
                                        </div>
                                        <div class="post-image">
                                            <img srcset="images/post-3.png 2x">
                                        </div>
                                        <div class="post-content">
                                            <div class="post-heading">
                                                Best flowers for inside home
                                            </div>
                                            <div class="post-desc">
                                                All the flowers are best for your lovely house
                                                just get the one you love the most 😊
                                            </div>
                                            <div class="post-more">
                                                <a href="#">Read more</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>               
                </div>
            </main>
            <footer class="footer">
                <div class="footer-container">
                    <a href="#"><h1><span>Flower</span> Shop</h1></a>
                    <ul class="menu">
                        <h3 class="footer-heading">Links</h3>
                        <li class="menu-item">
                            <a href="#" class="menu-link">Home</a>
                        </li>
                        <li class="menu-item">
                            <a href="#" class="menu-link">Shop</a>
                        </li>
                        <li class="menu-item">
                            <a href="#" class="menu-link">Blog</a>
                        </li>
                        <li class="menu-item">
                            <a href="#" class="menu-link">About</a>
                        </li>
                    </ul>
                    <div class="footer-contact">
                        <h3 class="footer-heading">Contact</h3>
                        <div class="footer-location">
                            <img srcset="./image/location-logo.png 2x" alt="">
                            <p class="footer-text">FPT University HCM</p>
                        </div>
                        <div class="footer-mail">
                            <img srcset="./image/email-logo.png 2x" alt="">
                            <p class="footer-text">support@Flowers.com</p>
                        </div>
                        <div class="footer-phone">
                            <img srcset="./image/phone-logo.png 2x" alt="">
                            <p class="footer-text">+1 236 5489</p>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </body>
</html>
