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
        <h3>List All Orders</h3>
        <table border="1" cellspacing="0">
            <tr>
                <th>Order ID</th>
                <th>Product</th>
                <th>Price</th>
                <th>User</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Status</th>
                <th>Change</th>
            </tr>
            <c:forEach var="s" items="${list}">
                <tr>
                    <td>${s.orderId}</td>
                    <td>
                        <ul>
                            <c:forEach var="v" items="${s.lp}">
                                <a href="/1849/infoProduct?id=${v.productId}"><li>${v.nameProduct}</li></a>
                                    
                            </c:forEach>
                        </ul>
                    </td>
                    <td>${s.price}</td>
                    <td>${s.userMail}</td>
                    <td>${s.address}</td>
                    <td>${s.phoneNumber}</td>
                    <td>
                        <c:if test="${s.status==1}">
                            <p style="color: green">Successfull</p>
                            ${s.receivedDate}
                        </c:if>
                        <c:if test="${s.status==2}">
                            <p style="color: blue">Not yet</p>
                        </c:if>      
                        <c:if test="${s.status==3}">
                            <p style="color: red">Cancel</p>
                        </c:if>     
                    </td>
                     <td>
                        <a href="report?id=${s.orderId}">Change</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
