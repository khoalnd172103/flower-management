<%-- 
    Document   : CreatePlant
    Created on : Feb 19, 2023, 8:36:10 PM
    Author     : Admin
--%>

<%@page import="sample.dto.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage plant - Create plant</title>
    </head>
    <body>
        <header>
            <%@include file="header_loginedAdmin.jsp" %>
        </header>
        <section class="admin"> 
            <div class="grid wide"> 
                <div class="row user-container"> 
                    <div class="col l-12"> 
                        <div class="admin-content"> 
                            <h3 class="admin-heading">Add plant</h3>
                            <form action="uploadFile" method="POST" class="form" enctype="multipart/form-data">
                                <div class="admin-plant-info">
                                    <p>Name: </p>
                                    <input type="txt" name="txtPlantName" required="">
                                </div>
                                <div class="admin-plant-info">
                                    <p>Price: </p>
                                    <input type="number" name="numberPrice" required="">
                                </div>
                                <div class="admin-plant-info">
                                    <p>Description: </p>
                                    <textarea type="txt" name="txtPlantDesc" required=""></textarea>
                                </div>
                                <div class="admin-plant-info">
                                    <p>Image file: </p>
                                    <input type="file" name="file" required><br><br>
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
                                <input type="submit" value="Add" class="admin-plant-button primary-button">
                            </form>
                        </div> 
                    </div> 
                </div> 
            </div> 
        </section>
    </body>
</html>
