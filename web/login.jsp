<%-- 
    Document   : login
    Created on : Oct 28, 2019, 9:49:08 PM
    Author     : cogn1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel='stylesheet' href='login.css' type='text/css' media='all' />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div class="container" id="container">            
            <div class="form-container sign-in-container">
                <form action="login" method="post" id="login">
                    <h1>Sign in</h1>   
                    <c:if test="${not empty sessionScope.error}">
                        <p style="color:red;">
                            ${sessionScope.error}
                        </p>
                    </c:if>
                    <input type="email" placeholder="Email" name="username" />
                    <input type="password" placeholder="Password" name="password" />
                    <a href="forgotPwd">Forgot your password?</a>
                    <button type="submit" form="login" value="Submit">Login</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">                   
                    <div class="overlay-panel overlay-right">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>                       
                    </div>
                </div>
            </div>
        </div>       
        <script type='text/javascript' color='252,3,184' zIndex='-1' opacity='20' count='99' src='//cdn.bootcss.com/canvas-nest.js/1.0.0/canvas-nest.min.js'></script><!-- hexo-inject:begin --><!-- Begin: Injected MathJax -->
        <script type="text/x-mathjax-config">
            MathJax.Hub.Config({"tex2jax":{"inlineMath":[["$","$"],["\\(","\\)"]],"skipTags":["script","noscript","style","textarea","pre","code"],"processEscapes":true},"TeX":{"equationNumbers":{"autoNumber":"AMS"}}});
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
