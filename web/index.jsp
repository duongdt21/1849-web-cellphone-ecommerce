<%-- 
    Document   : index
    Created on : Oct 28, 2019, 10:30:44 PM
    Author     : cogn1
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
<link rel='stylesheet' href='css/paging.css' type='text/css' media='all' />
<link rel='stylesheet' href='css/1.css' type='text/css' media='all' />
<link rel='stylesheet' href='css/2.css' type='text/css' media='all' />
<link rel='stylesheet' href='css/3.css' type='text/css' media='all' />
<link rel='stylesheet' href='css/4.css' type='text/css' media='all' />
<link rel='stylesheet' href='css/5.css' type='text/css' media='all' />
<link rel='stylesheet' href='css/6.css' type='text/css' media='all' />
<link rel='stylesheet' href='css/7.css' type='text/css' media='all' />
<link rel='stylesheet' href='css/8.css' type='text/css' media='all' />
<link rel='stylesheet' id='font-awesome-5-css' href='https://preview1.cssigniter.com/preview/nozama-lite/wp-content/themes/nozama-lite/assets/vendor/fontawesome/css/font-awesome.css?.0' type='text/css' media='all' />
<link rel='stylesheet' href='css/10.css' type='text/css' media='all' />
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="shortcut icon" type="image/png" href="media/favicon.png"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script>
            $(function () {
                $("#includedContent").load("header.jsp");
            });
        </script>
        <title>Index</title>

    </head>
    <body>  

        <div id="includedContent"></div>

        <!--show products-->
        <section id="ci-home-latest-products-1" class="widget-section widget_ci-home-latest-products">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-heading">

                        </div>
                        <div class="woocommerce columns-4 ">
                            <div class="row row-items columns-4">

                                <jsp:useBean id="p" class="bean.PagingIndex" scope="request"/>
                                <jsp:setProperty name="p" property="*"/>
                                <c:forEach var="x" items="${p.productsAll}">
                                    <div class="col-xl-3 col-lg-4 col-sm-6 col-12">
                                        <div class="item item-product product type-product post-175 status-publish first instock product_cat-mobiles-tablets product_tag-apple product_tag-mobile has-post-thumbnail sale shipping-taxable purchasable product-type-simple">
                                            <div class="item-thumb">
                                                <a href="infoProduct?id=${x.id}"><img width="200" height="200" src="${x.src}" class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail"  alt="" sizes="(max-width: 630px) 100vw, 630px" /></a>
                                            </div>
                                            <div class="item-content">
                                                <div class="item-meta"><span class="item-categories"><a href="search?product_cat=all&s=${x.type}" rel="tag">${x.type.toUpperCase()}</a></span></div>
                                                <p class="item-title"><a href="infoProduct?id=${x.id}"> ${x.name} </a></p><span class="price"><del><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#36;</span>${Math.round(x.price * 1.3 * 100.0) / 100.0}</span>
                                                    </del><ins><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#36;</span>${x.price}</span></ins></span>
                                                <div class="item-star-rating">
                                                    <div class="star-rating" role="img" aria-label="Rated 3.00 out of 5"><span style="width:60%">Rated <strong class="rating">3.00</strong> out of 5</span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <div class="container">
            <ul class="pagination">
                <li><a href="?page=${param.page>1?param.page-1:1}">«</a></li>
                    <c:forEach var="i" begin="1" end="${p.pagesAll}" step="1">
                    <li class="${i==param.page?"active":""}"><a href="?page=${i}">${i}</a></li>
                    </c:forEach>
                <li><a href="?page=${param.page<p.pagesAll?param.page+1:p.pagesAll}">»</a></li>
            </ul>
        </div>


        <!--end show products-->
        <script>
            $(function () {
                $("#footer").load("footer.jsp");
            });
        </script>
         <div id="footer"></div>

    </body>
</html>
