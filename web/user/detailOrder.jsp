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

                    <h2>Order Information</h2>

                    <c:if test="${order.status==1}">
                        <h4>Order Status: Successful</h4>
                    </c:if>
                    <c:if test="${order.status==3}">
                        <p> <h4>Order Status: </h4> <strong style="color: red">Cancelled</strong>
                    </c:if>  
                    <c:if test="${order.status==2}">
                        <h4>Order Status: Delivering</h4>
                    </c:if>    
                    <h4>Delivery information</h4>
                    <h5>Order Date: ${order.orderDate}</h5>
                    <c:if test="${order.status==1}">
                        <h5>Received Date: ${order.receivedDate}</h5>
                    </c:if>

                    <h3>Products</h3>   
                    <table border="1" cellspacing="0" width="500px">
                        <tr>
                            <th width="250px">
                                Product
                            </th>
                            <th width="250px">
                                Amount
                            </th>
                        </tr>
                        <c:forEach var="s" items="${order.lp}">
                            <tr>
                                <td>
                                    ${s.nameProduct}
                                </td>
                                <td>
                                    ${s.amountProduct}
                                </td>
                            </tr>
                        </c:forEach>
                    </table>

                    <h4>Total Price: ${order.price} </h4>    

                    <h4>Address: ${order.address}</h4>

                    <c:if test="${order.status==2}">
                        <c:url var="cancel" value="cancel">
                            <c:param name="id" value="${order.orderId}"/>

                        </c:url>
                        <button type="button" class="btn btn-warning" onclick="window.location = '${cancel}';" >Cancel this order</button>
                    </c:if>  
                    <c:if test="${not empty sessionScope.error}">
                        <p style="color:red;">
                            ${sessionScope.error}
                        </p>
                    </c:if>
                    <a href="order-history">Back to your history</a>
            </div>
        </section>
    </body>
</html>
