<%-- 
    Document   : CreateCategory
    Created on : Feb 20, 2023, 4:04:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage category - Create category</title>
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
                                <input type="hidden" name="cid" value="1">
                                <div class="admin-category-desc">
                                    <p>Category name: </p>
                                    <input type="text" name="txtcategory" required="">
                                </div>
                                <input type="submit" value="Add category" name="action" class="primary-button">
                            </form>
                        </div>
                    </div> 
                </div> 
            </div> 
        </section>
    </body>
</html>
