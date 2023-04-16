<%-- 
    Document   : EditPlantProduct
    Created on : Feb 19, 2023, 7:16:24 PM
    Author     : Admin
--%>

<%@page import="sample.dto.Category"%>
<%@page import="sample.dao.CategoryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dto.Plant"%>
<%@page import="sample.dao.PlantDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage plant - Update plant</title>
        <link rel="stylesheet" href="grid.css" />
        <link rel="stylesheet" href="app.css" />
    </head>
    <body>
        <header>
            <%@include file="header_loginedAdmin.jsp" %>
        </header>

        <section class="admin">
            <div class="grid wide">
                <div class="row user-container">
                    <div class="row admin-plant-content">
                        <div class="col l-4">
                            <div class="admin-content">
                                <%
                                    String pid = request.getParameter("pid");
                                    String[] status = {"Out of stock", "Available"};
                                    Plant p = PlantDAO.getPlant(new Integer(pid));
                                %>
                                <table>
                                    <tr>
                                        <th>ID</th>
                                        <th>Image</th>
                                    </tr>
                                    <tr>
                                        <td><%= p.getId()%></td>
                                        <td><img src="<%= p.getImgpath()%>"></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="col l-8">
                            <form action="MainController" method="post" class="admin-category">
                                <input type="hidden" name="pid" value="<%= p.getId()%>">
                                <div class="admin-plant-info">
                                    <p>Name: </p>
                                    <input type="text" name="txtPlantName" value="<%= p.getName()%>">
                                </div>
                                <div class="admin-plant-info">
                                    <p>Description: </p>
                                    <input type="text" name="txtPlantDescription" value="<%= p.getDescription()%>">
                                </div>
                                <div class="admin-plant-info">
                                    <p>Price: </p>
                                    <input type="number" name="numberPrice" value="<%= p.getPrice()%>">
                                </div>
                                <div class="admin-plant-info">
                                    <p>Status: </p>
                                    <select name="status">
                                        <option value="available">Available</option>
                                        <option value="inAvailable">In available</option>
                                    </select>
                                </div>
                                <div class="admin-plant-info">
                                    <p>Category: </p>
                                    <select name="cateid">
                                        <%
                                            ArrayList<Category> list = CategoryDAO.getCategories();
                                            if (list != null && list.size() > 0) {
                                                for (Category cate : list) {
                                        %>
                                        <option value="<%= cate.getCateName()%>"><%= cate.getCateName()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                <input type="submit" value="Save plant" name="action" class="admin-plant-button primary-button">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
