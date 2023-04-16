<%-- 
    Document   : ViewPlant
    Created on : Feb 18, 2023, 7:13:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="plantObj" class="sample.dto.Plant" scope="request"/>
        <table>
            <tr><td rowspan="8"><img src="${plantObj.imgpath}" width="200" height="200"></td></tr>
            <tr><td>ID: ${plantObj.id}</td></tr>                
            <tr><td>Name: ${plantObj.name}</td></tr>
            <tr><td>Price: ${plantObj.price}</td></tr> 
            <tr><td>Description: ${plantObj.description}</td></tr> 
            <tr><td>Status: ${plantObj.status}</td></tr> 
            <tr><td>Cate ID: ${plantObj.cateid}</td></tr> 
            <tr><td>Category: ${plantObj.catename}</td></tr>
        </table>
    </body>
</html>
