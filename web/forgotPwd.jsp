<%-- 
    Document   : forgotPwd
    Created on : Oct 31, 2019, 11:02:41 AM
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
        <h3> Enter your mail to reset your password.
        <form action="forgotPwd" method="POST">
            <p>Enter your email <input type="text" name="username">
            <p><input type="submit" value="Send">   
        </form>
        <c:if test="${not empty noti}">
            <p>${noti}.
        </c:if>
    </body>
</html>
