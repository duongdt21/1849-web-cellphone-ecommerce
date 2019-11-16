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
                $("#includedContent").load("../header.jsp");
            });
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History | IA1304 - 1849</title>

    </head> 
    <body>
        <div id="includedContent"></div>
        <section id="ci-home-latest-products-1" class="widget-section widget_ci-home-latest-products">
            <div class="container">
                <br>
                <c:if test="${not empty list}" >


                    <h3>List All Orders</h3>
                    <table border="1" cellspacing="0">
                        <tr>
                            <th>Order ID</th>
                            <th>Product</th>
                            <th>Price</th>


                            <th>Status</th>

                        </tr>
                        <c:forEach var="s" items="${list}">
                            <tr>
                                <td><a href="order-detail?id=${s.orderId}">${s.orderId}</a> </td>
                                <td>
                                    <ul>
                                        <c:forEach var="v" items="${s.lp}">
                                            <a href="/1849/infoProduct?id=${v.productId}"><li>${v.nameProduct}</li></a>

                                        </c:forEach>
                                    </ul>
                                </td>
                                <td>${s.price} triệu VNĐ</td>

                                <td>
                                    <c:if test="${s.status==1}">
                                        <p style="color: green">Successfull</p>
                                        ${s.receivedDate}
                                    </c:if>
                                    <c:if test="${s.status==2}">
                                        <p style="color: blue">Not yet</p>
                                    </c:if>      
                                    <c:if test="${s.status==3}">
                                        <p style="color: red">Cancel</p>
                                    </c:if>     
                                </td>

                            </tr>
                        </c:forEach>
                    </table>

                </c:if>

                <c:if test="${empty list}">
                    <h3>You don't have any order!</h3>
                </c:if>
            </div>
        </section>
    </body>
</html>
