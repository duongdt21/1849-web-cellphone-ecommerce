<%-- 
    Document   : pay
    Created on : Nov 13, 2019, 5:01:20 PM
    Author     : cogn1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pay</title>
    </head>
    <body>
        <form action="pay" method="POST">
            <p> Phone: <input type="number" name="phone">
            <p> Address: <input type="text" name="address"> 
            <p> Discount code(if have): <input type="text" name="discount"> 
            <p> <input type="submit" name="Pay">
        </form>
    </body>
</html>
