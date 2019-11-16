<%-- 
    Document   : cart
    Created on : Nov 13, 2019, 12:35:18 AM
    Author     : cogn1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>
        <c:if test="${empty sessionScope.cart or sessionScope.cart.items.size() eq 0 }">
            <h1>Your cart is empty, click <a href="/1849/index.jsp">here</a> to shopping</h1>           
        </c:if>
        <c:if test="${not empty sessionScope.cart and sessionScope.cart.items.size() ne 0}">
            <table border="1" cellspacing="0">
                <tr>
                <th>Products in cart: ${sessionScope.cart.items.size()}</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Amount</th>
            </tr>


            <c:forEach var="x" items="${sessionScope.cart.items}">
                <tr>
                    <td>
                        ${x.name} </br>
                        ID: ${x.id}
                    </td>
                    <td>($) ${x.price}</td>
                    <td>${x.number}</td>
                    <td>($) ${Math.round(x.price * x.number * 100.0) / 100.0}</td>
                    <td>
                        <c:url var="delete" value="cart">
                            <c:param name="id" value="${x.id}"/>
                            <c:param name="action" value="delete"/>
                        </c:url>
                        <a href="${delete}" onclick="return confirm('delete?')">delete</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="4" align="right">
                    Total ${sessionScope.cart.amount}
                </td>    
            </tr>
            
        </table>
            <a href="pay.jsp">Pay</a>        
    </c:if>   
</body>
</html>
