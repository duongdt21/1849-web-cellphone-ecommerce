<%-- 
    Document   : listall
    Created on : Nov 12, 2019, 2:35:07 PM
    Author     : DuongDT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="orders-list">All Orders</a>
        <a href="in-stock">Orders in stock</a>
        
        <br>
        <br>
        <h3>List All Orders In Stock</h3>
        <table border="1" cellspacing="0">
            <tr>
                <th>Order ID</th>
                <th>Product</th>
                <th>Price</th>
                <th>User</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Order Date</th>
                <th>Report Order</th>
            </tr>
            <c:forEach var="s" items="${list}">
                <tr>
                    <td>${s.orderId}</td>
                    <td>
                        <ul>
                            <c:forEach var="v" items="${s.lp}">
                                <a href="#"><li>${v.nameProduct}</li></a>
                                    
                            </c:forEach>
                        </ul>
                    </td>
                    <td>${s.price}</td>
                    <td>${s.userMail}</td>
                    <td>${s.address}</td>
                    <td>${s.phoneNumber}</td>
                    <td>
                        ${s.orderDate}
                    </td>
                    <td>
                        <a href="report?id=${s.orderId}">Change</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
