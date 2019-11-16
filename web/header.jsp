<%-- 
    Document   : header
    Created on : Nov 12, 2019, 8:19:11 PM
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

<!DOCTYPE html>
<link rel="shortcut icon" type="image/png" href="media/favicon.png"/>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!--Search box-->
        <header class="header">
            <div class="head-mast">
                <div class="head-mast-container">
                    <div class="head-mast-row">
                        <div class="header-branding-wrap"> <a href="#mobilemenu" class="mobile-nav-trigger"><i class="fas fa-bars"></i> <span class="sr-only">Menu</span></a>
                            <div class="site-branding">
                                <h1 class="site-logo"><a href="index.jsp?page=1" rel="home">   1849</a></h1>
                                <p class="site-tagline">Let's pass Java Web <3</p>
                            </div>
                        </div>
                        <div class="head-search-form-wrap">
                            <form class="category-search-form" action="search" method="get">
                                <label for="category-search-name" class="sr-only"> Category name </label>
                                <select name="product_cat" id="category-search-name" class="category-search-select">
                                    <option value="all">Search all categories</option>
                                    <option class="level-0" value="cellphone">Cell Phone</option>
                                    <option class="level-0" value="earphone">Earphone</option>
                                    <option class="level-0" value="speaker">Speaker</option>
                                    <option class="level-0" value="powerbank">Power Bank</option>
                                    <option class="level-0" value="screenstickers">Screen Stickers</option>
                                    <option class="level-0" value="cable-charger">Cable Charger</option>
                                    <option class="level-0" value="case">Case</option>                   
                                </select>

                                <div class="category-search-input-wrap">
                                    <label for="category-search-input" class="sr-only"> Search text </label>
                                    <input type="text" class="category-search-input" style="color:#000" id="category-search-input" placeholder="What are you looking for?" name="s" autocomplete="on">
                                    <ul class="category-search-results">
                                    </ul> <span class="category-search-spinner"></span>
                                </div>
                                <button type="submit" class="category-search-btn"> <i class="fas fa-search"></i><span class="sr-only">Search</span> </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--End search box-->

            <!--Menu bar-->
            <div class="head-nav">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <nav class="nav">
                                <ul id="header-menu-1" class="navigation-main">
                                    <li class="menu-item-first fas fa-star menu-item menu-item-type-post_type menu-item-object-page menu-item-210"><a href="index.jsp?page=1">Today’s Deals</a></li>
                                    <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home current-menu-item page_item page-item-56 current_page_item menu-item-57"><a href="index.jsp?page=1" aria-current="page">Home</a></li>
                                    <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-278"><a href="#">Products</a>
                                        <ul class="sub-menu">
                                            <li class="menu-item menu-item-type-post_type menu-item-object-product menu-item-280"><a href="phone.jsp?type=cellphone&page=1">Cell Phone</a></li>
                                            <li class="menu-item menu-item-type-post_type menu-item-object-product menu-item-279"><a href="earphone.jsp?type=earphone&page=1">Earphone</a></li>
                                            <li class="menu-item menu-item-type-post_type menu-item-object-product menu-item-299"><a href="speaker.jsp?type=speaker&page=1">Speaker</a></li>
                                            <li class="menu-item menu-item-type-post_type menu-item-object-product menu-item-281"><a href="powerbank.jsp?type=powerbank&page=1">Power Bank</a></li>
                                            <li class="menu-item menu-item-type-post_type menu-item-object-product menu-item-286"><a href="sticker.jsp?type=screenstickers&page=1">Screen Sticker</a></li>
                                            <li class="menu-item menu-item-type-post_type menu-item-object-product menu-item-282"><a href="charge.jsp?type=cable-charger&page=1">Cable Charger</a></li>
                                            <li class="menu-item menu-item-type-post_type menu-item-object-product menu-item-283"><a href="case.jsp?type=case&page=1">Case</a></li>                                 
                                        </ul>
                                    </li>

                                    <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-36"><a href="aboutus.jsp">About Us</a></li>                               
                                </ul>                       

                                <c:if test="${cookie['loginname'] ne null}">
                                    <ul id="header-menu-2" class="navigation-main navigation-secondary">
                                        <li class="fas fa-user menu-item menu-item-type-post_type menu-item-object-page menu-item-211"><a href="#">${cookie['loginname'].value}</a>
                                            <ul class="sub-menu">
                                                <li class="menu-item menu-item-type-post_type menu-item-object-product menu-item-280"><a href="#">Profile</a></li>
                                                <li class="menu-item menu-item-type-post_type menu-item-object-product menu-item-279"><a href="#">Setting</a></li>
                                                <li class="menu-item menu-item-type-post_type menu-item-object-product menu-item-299"><a href="http://localhost:8080/1849/user/cart.jsp">Order</a></li>
                                                <li class="menu-item menu-item-type-post_type menu-item-object-product menu-item-299"><a href="http://localhost:8080/1849/user/order-history">Order History</a></li>
                                                <li class="menu-item menu-item-type-post_type menu-item-object-product menu-item-282"><a href="http://localhost:8080/1849/changePwd">Change Password</a></li>           
                                                <li id="menu-item-211" class="menu-item menu-item-type-post_type menu-item-object-product menu-item-282"><a href="logout">Logout</a></li>                                
                                            </ul>
                                        </li>
                                    </ul>
                                </c:if>
                                <c:if test="${cookie['loginname'] eq null}">
                                    <ul id="header-menu-2" class="navigation-main navigation-secondary">
                                        <li id="menu-item-211" class="fas fa-user menu-item menu-item-type-post_type menu-item-object-page menu-item-211"><a href="login">Login</a></li>
                                        <li id="menu-item-211" class="fas fa-user menu-item menu-item-type-post_type menu-item-object-page menu-item-211"><a href="register.jsp">Register</a></li>
                                    </ul>
                                </c:if>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!--End menu bar-->
    </body>
</html>
