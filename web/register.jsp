<%-- 
    Document   : register
    Created on : Oct 29, 2019, 12:11:28 AM
    Author     : cogn1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel='stylesheet' href='css/register.css' type='text/css' media='all' />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://www.google.com/recaptcha/api.js"></script>

        <title>Register</title>
    </head>

    <body>

        <form action="register" method="POST">
            <div class="container" id="container">  
                <tr>
                    <td>Username</td> 
                    <td><input type="email" name="username" id="username"/></td>
                </tr>
                <p id="err" style="color: red"></p>
                <tr>
                    <td>Password </td>
                    <td><input type="text" name="password" id="password"/></td>
                </tr>
                <p id="err1" style="color: red"></p>
                <tr>
                    <td>Confirm Password </td>
                    <td><input type="text" name="password_cf" id="password_cf"/></td>
                </tr>
                <p id="err2" style="color: red"></p>
                <tr>
                    <td>Full Name </td>
                    <td><input type="text" name="name" id="name"/></td>
                </tr>
                <p id="err3" style="color: red"></p>
                <tr>
                    <td>Address </td>
                    <td><input type="text" name="address" id="address"/></td>
                </tr>
                <p id="err4" style="color: red"></p>
                <tr>
                    <td>Phone </td>
                    <td><input type="text" name="phone" id="phone" /></td>
                </tr>
                <p id="err5" style="color: red"></p>
                <br>



                <br><br>
                <div class="g-recaptcha" data-callback="myFunction"
                     data-sitekey="6Lc0H74UAAAAANB0BayPSyML5s2OQd-O2yyiZi_E"></div>
                <p> <input type="checkbox" id="accept" name="accept"/> Accept out rules </p>
                <button type="submit" value="Register" id="mySubmit" disabled="disabled">Register</button>  

            </div>
        </form>
        <script src="validateRegister.js"></script>

        <c:if test="${not empty error}">
            <h5 style="color:red;">
                ${error}
            </h5>
        </c:if>        

        <script type='text/javascript' color='252,3,184' zIndex='-1' opacity='20' count='99' src='//cdn.bootcss.com/canvas-nest.js/1.0.0/canvas-nest.min.js'></script><!-- hexo-inject:begin --><!-- Begin: Injected MathJax -->
        <script type="text/x-mathjax-config">
            MathJax.Hub.Config({"tex2jax":{"inlineMath":[["$","$"],["\\(","\\)"]],"skipTags"😞"script","noscript","style","textarea","pre","code"],"processEscapes":true},"TeX":{"equationNumbers":{"autoNumber":"AMS"}}});
        </script>

        <script type="text/x-mathjax-config">
            MathJax.Hub.Queue(function() {
            var all = MathJax.Hub.getAllJax(), i;
            for(i=0; i < all.length; i += 1) {
            all[i].SourceElement().parentNode.className += ' has-jax';
            }
            });
        </script>

    </body>
</html>