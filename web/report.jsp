<%-- 
    Document   : report
    Created on : Nov 4, 2019, 8:10:49 PM
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
        <c:if test="${not empty sessionScope.error}">
            <h1>Hack me if you can!</h1> 
            <p><a href="javascript:history.back()">I can't!</a>
        </c:if>
    </body>
</html>
