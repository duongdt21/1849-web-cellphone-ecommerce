<%-- 
    Document   : resetPwd
    Created on : Oct 31, 2019, 12:52:01 PM
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
        <c:if test="${not empty username}">
            <h2>Enter new password for ${username}</h2>
            <form action="resetPwd" method="POST">
                <p><input type="hidden" name="user" value="${username}">
            <p> Enter Password <input type="text" name="password"/>
            <p> re-Enter Password <input type="text" name="passwordcf"/>
            <p><input type="submit" value="Reset">   
        </form>
        </c:if>
            <c:if test="${not empty noti}">
        <h5 style="color:red;">
            ${noti}
        </h5>
    </c:if>   
        
    </body>
</html>
