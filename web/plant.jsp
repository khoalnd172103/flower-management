<%-- 
    Document   : plant
    Created on : Feb 17, 2023, 7:19:12 PM
    Author     : Admin
--%>

<%@page import="sample.dto.Plant"%>
<%@page import="sample.dao.PlantDAO"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String pid = (String) request.getParameter("pid");
            Plant p = PlantDAO.getPlant(new Integer(pid));
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flower shop - <%= p.getName()%> detail</title>
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
            <%
                }
            %>
            <section class="flower">
                <div class="grid wide">
                    <%
                        String[] status = {"Out of stock", "Available"};
                        if (p != null) {
                    %>
                    <div class="row flower-container">
                        <div class="col l-4">
                            <div class="flower-image">
                                <img src="<%= p.getImgpath()%>">
                            </div>
                        </div>
                        <div class="col l-8">
                            <div class="flower-content">
                                <h4 class="flower-name"><%= p.getName()%></h4>
                                <p class="flower-desc">Description: <%= p.getDescription()%></p>
                                <h4 class="flower-desc <%= (p.getStatus() != 1) ? "mark" : ""%>">Status: <%= status[p.getStatus()]%></h4>
                                <h4 class="flower-desc">Cate ID: <%= p.getCateid()%></h4>
                                <h4 class="flower-desc">Category: <%= p.getCatename()%></h4>
                                <div class="flower-action">
                                    <h4 class="flower-price">
                                        <%= p.getPrice()%>$ / each
                                    </h4>
                                    <%
                                        if (p.getStatus() == 1) {
                                    %>
                                    <div class="flower-cart">
                                        <a href="MainController?action=addtocart&pid=<%= p.getId()%>" class="flower-button primary-button">Add to cart</a>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </section>
        </div>
    </body>
</html>
