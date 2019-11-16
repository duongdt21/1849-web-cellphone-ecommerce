<%-- 
    Document   : list
    Created on : Nov 5, 2019, 5:17:25 PM
    Author     : Hoang
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
        <form action="search" method="GET">
            <p>Search : <input type="text" name="search" value="${param.search}">
                <input type="submit" value="Search">
        </form>
        <form action="addproduct" method="GET">
            <p><input type="submit" value="Add">
        </form>

        <table border="1" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Number</th>
                <th>Delete</th>
                <th>Update</th>
                <th>Update Number</th>
            </tr>
            <c:forEach var="s" items="${products}">
                <tr>
                    <td>${s.id}</td>
                    <td>${s.name}</td>
                    <td>${s.price}</td>
                    <td>${s.amount}</td>
                    <td><a href="deleteproduct?id=${s.id}&search=${param.search}" onclick="return confirm('Are you sure ?');">Delete</a></td>
                    <td><a href="update?id=${s.id}">Update</a></td>
                    <td><a href="updatenumber?id=${s.id}">Update Number</a></td>
                </tr>
            </c:forEach>
        </table>
        <p><a href="index.jsp">Back to admin Page</a>
    </body>
</html>
