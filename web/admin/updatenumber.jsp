<%-- 
    Document   : updatenumber
    Created on : Nov 11, 2019, 4:22:44 PM
    Author     : Hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="updatenumber">
            <h1>Update Number</h1>
            <p>Product id <input type="text" name="id" value="${id}" readonly="">
            <p>Number <input type="text" name="number" value="${number}">
            <p><input type="submit" name="update" value="Update">
        </form>
    </body>
</html>
