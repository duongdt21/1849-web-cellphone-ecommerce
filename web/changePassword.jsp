<%-- 
    Document   : changePassword
    Created on : Nov 11, 2019, 9:54:37 PM
    Author     : cogn1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>
        <h1>Change password for ${sessionScope.user}</h1>
        <c:if test="${not empty sessionScope.noti}">
            <p style="color: red"> ${sessionScope.noti}</p>
        </c:if>
        <form action="changePwd" method="POST">
            <table border="0">

                <tr>
                    <td>Old Password</td>
                    <td><input type="password" name="oldPwd"/></td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td><input type="password" name="newPwd"/></td>
                </tr>
                <tr>
                    <td>Confirm</td>
                    <td><input type="password" name="cfPwd"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Change" /></td>
                    <td></td>
                </tr>
            </table>

        </form>
    </body>
</html>
