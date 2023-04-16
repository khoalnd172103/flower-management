<%-- 
    Document   : ManagePlant
    Created on : Feb 19, 2023, 6:59:25 PM
    Author     : Admin
--%>

<%@page import="sample.dao.PlantDAO"%>
<%@page import="sample.dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard - Manage plant</title>
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
                            <h3 class="admin-heading">Manage plant</h3>
                            <%
                                //String keyword = request.getParameter("txtsearch");
                                ArrayList<Plant> list = PlantDAO.getPlants();
                                String[] tmp = {"Out of stock", "Available"};
                            %>
                            <table class="plant">
                                <tr>
                                    <th>ID</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                    <th>Status</th>
                                    <th>Category</th>
                                    <th>Action</th>
                                </tr>
                                <%
                                    if (list != null && list.size() > 0) {
                                        for (Plant p : list) {
                                %>
                                <tr>
                                    <td><%= p.getId()%></td>
                                    <td><img src="<%=p.getImgpath()%>" class="plantimg"></td>
                                    <td><%= p.getName()%></td>
                                    <td><%= p.getDescription()%></td>
                                    <td><%= p.getPrice()%></td>
                                    <td><%= tmp[p.getStatus()]%></td>
                                    <td><%= p.getCatename()%></td>
                                    <td>
                                        <form action="EditPlantProduct.jsp?pid=<%= p.getId()%>" method="post">
                                            <input type="submit" value="Edit" class="primary-button">
                                        </form>
                                    </td>
                                </tr>
                                <% }
                                    }
                                %>
                            </table>
                            <form action="CreatePlant.jsp" method="post">
                                <input type="submit" value="Add" class="primary-button">
                            </form>
                        </div> 
                    </div> 
                </div> 
            </div> 
        </section>
    </body>
</html>
