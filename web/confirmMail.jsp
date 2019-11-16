<%-- 
    Document   : confirmMail
    Created on : Oct 29, 2019, 2:10:24 PM
    Author     : cogn1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p> Check your mail ${cookie['loginname'].value}
        <p>    <a href="login.jsp">Login</a> 
    </body>
</html>
