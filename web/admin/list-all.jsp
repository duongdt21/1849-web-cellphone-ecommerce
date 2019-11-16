<%-- 
    Document   : infor_shiper
    Created on : Nov 3, 2019, 11:46:34 AM
    Author     : maimaimai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>List Shipper</h1>
        <c:if test="${ empty shipper}">
            <h1>List shipper is empty</h1>
        </c:if>
        <c:if test="${ not empty shipper}">
            <table border="1" cellspacing="0">
                <thead>
                    <tr>
                        <th>Shipper</th>
                        <th>Information</th>
                    </tr>
                </thead>
                <c:forEach var="x" items="${shipper}">
                    <tbody>
                        <tr>
                            <td>${x.userName}</td>
                            <td><a href="information?mail=${x.userMail}"/>Information</a></td>
                        </tr>
                    </tbody>    
                </c:forEach>

            </table>

        </c:if>

        <h1>List Admin</h1>
        <c:if test="${ empty admin}">
            <h1>List shipper is empty</h1>
        </c:if>
        <c:if test="${ not empty admin}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Shipper</th>
                        <th>Information</th>
                    </tr>
                </thead>
                <c:forEach var="x" items="${admin}">
                    <tbody>
                        <tr>
                            <td>${x.userName}</td>
                            <td><a href="information?mail=${x.userMail}"/>Information</a></td>
                        </tr>
                    </tbody>    
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
