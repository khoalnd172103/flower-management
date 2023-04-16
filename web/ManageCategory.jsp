<%-- 
    Document   : ManageCatogry
    Created on : Feb 20, 2023, 3:46:51 PM
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
        <title>Dashboard - Manage category</title>
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
                            <h3 class="admin-heading">Manage category</h3>
                            <%
                                ArrayList<Category> list = CategoryDAO.getCategories();
                            %>
                            <table class="order">
                                <tr>
                                    <th>Cate ID</th>
                                    <th>Cate Name</th>
                                    <th>Action</th>
                                </tr>
                                <%
                                    if (list != null && list.size() > 0) {
                                        for (Category cate : list) {
                                %>
                                <tr>
                                    <td><%= cate.getCateID()%></td>
                                    <td><%= cate.getCateName()%></td>
                                    <td>
                                        <form action="EditCateProduct.jsp?cateID=<%= cate.getCateID()%>&cateName=<%= cate.getCateName()%>" method="post">
                                            <input type="submit" value="Edit" class="primary-button">
                                        </form>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </table>
                            <form action="CreateCategory.jsp" method="post">
                                <input type="submit" value="Add" class="primary-button">
                            </form>
                        </div> 
                    </div> 
                </div> 
            </div> 
        </section>
        <section>

        </section>
        <!--        <footer>
        <%@include file="footer.jsp" %>
    </footer>-->
    </body>
</html>
