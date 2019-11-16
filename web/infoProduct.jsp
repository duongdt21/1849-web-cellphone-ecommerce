<%-- 
    Document   : infoProduct
    Created on : Nov 12, 2019, 11:54:15 PM
    Author     : duongdt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel='stylesheet' id='wc-block-style-css' href='https://preview1.cssigniter.com/preview/nozama-lite/wp-content/cache/busting/132/preview/nozama-lite/wp-content/plugins/woocommerce/packages/woocommerce-blocks/build/style-2.3.0.css' type='text/css' media='all' />
<style id='woocommerce-inline-inline-css' type='text/css'>
    .woocommerce form .form-row .required {
        visibility: visible
    }
</style>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel='stylesheet' href='../css/paging.css' type='text/css' media='all' />
<link rel='stylesheet' href='../css/1.css' type='text/css' media='all' />
<link rel='stylesheet' href='../css/2.css' type='text/css' media='all' />
<link rel='stylesheet' href='../css/3.css' type='text/css' media='all' />
<link rel='stylesheet' href='../css/4.css' type='text/css' media='all' />
<link rel='stylesheet' href='../css/5.css' type='text/css' media='all' />
<link rel='stylesheet' href='../css/6.css' type='text/css' media='all' />
<link rel='stylesheet' href='../css/7.css' type='text/css' media='all' />
<link rel='stylesheet' href='../css/8.css' type='text/css' media='all' />
<link rel='stylesheet' id='font-awesome-5-css' href='https://preview1.cssigniter.com/preview/nozama-lite/wp-content/themes/nozama-lite/assets/vendor/fontawesome/css/font-awesome.css?.0' type='text/css' media='all' />
<link rel='stylesheet' href='../css/10.css' type='text/css' media='all' />
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script>
            $(function () {
                $("#includedContent").load("header.jsp");
            });
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${product.name} | IA1304 - 1849</title>

    </head> 
    <body>
        <div id="includedContent"></div>
        <section id="ci-home-latest-products-1" class="widget-section widget_ci-home-latest-products">
            <div class="container">
                <h2 style="margin-top: 20px;margin-left: 20px">${product.name} </h2>
                <hr style="margin-top: -15px">
                <div class="content-product" style="margin-top: 25px;margin-left: 20px;display: flex;justify-content: flex-start">


                    <div class="img-product" style="width: 500px">
                        <img src="${product.src}" width="400" height="400">
                    </div>
                    <div class="info" style="width: 400px">
                        <p style="color: red;font-size: 35px"> ${product.price}0.000 VNĐ
                            <br>    
                        <p> Product Description: ${product.description} 
                            <br>
                            <br>

                            <c:url var="buy" value="user/cart">
                                <c:param name="id" value="${product.id}"/>
                                <c:param name="action" value="add"/>
                            </c:url>
                            <button type="button" class="btn btn-warning" onclick="window.location = '${buy}';"${amount > 0 ? "" : "disabled"} >Add to cart</button>    
                    </div>
                </div>


                <div class="comment" style="margin-left: 50px;width: 800px;margin-top: 50px"> 
                    <h3>Comment for product</h3>
                    <div class="send-comment">
                        <form action="user/send-comment">
                            <input type="text" name="id-product" value="${product.id}" hidden>
                            <input type="text" name="comment_content"placeholder="Your questions" size="100px">
                            <input type="submit" value="Comment">
                        </form>
                    </div>
                    <c:if test="${not empty comment}">
                        <c:forEach var="s" items="${comment}">
                            <div class="comment-content">
                                <hr>
                                <p style="color: #3745AE ">${s.userName}</p>
                                <p style="margin-left: 20px">${s.comment_content}</p>
                                <p style="color: darkgrey;margin-left: 10px">${s.comment_date}</p>
                                <c:if test="${not empty s.lr}">
                                    <c:forEach var="i" items="${s.lr}">
                                        <div class="reply" style="margin-left: 50px">
                                            <p style="color: #3745AE ">${i.userName}</p>
                                            <p style="margin-left: 20px">${i.reply_content}</p>
                                            <p style="color: darkgrey;margin-left: 10px">${i.reply_date}</p>
                                        </div>
                                    </c:forEach>
                                </c:if>  
                                <div class="send-reply" style="margin-left: 50px">
                                    <form action="user/send-reply">
                                        <input type="text" name="id-product" value="${s.productId}" hidden>
                                        <input type="text" name="id-comment" value="${s.commentId}" hidden>
                                        <input type="text" name="reply_content"placeholder="Reply" size="100px">
                                        <input type="submit" value="Reply">
                                    </form>
                                </div>
                            </div>



                        </c:forEach>
                    </c:if>
                    <c:if test="${empty comment}"> <h4>Not having any comment</h4></c:if>

                </div>    
            </div>
        </section>
    </body>
</html>
