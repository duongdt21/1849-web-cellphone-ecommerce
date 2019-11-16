<%-- 
    Document   : index
    Created on : Nov 4, 2019, 6:54:23 PM
    Author     : cogn1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Shipper page</h1>
        <c:if test="${cookie['loginname'] ne null}">
            <p> Welcome ${cookie["loginname"].value} -  <a href="/1849/logout">Logout</a> </p>             
        </c:if>
            
        <c:if test="${cookie['loginname'] eq null}">
            <p> Not login
            <p><a href="login">Login</a>
            <p><a href="register">Register</a>
        </c:if>     
    </body>
</html>
