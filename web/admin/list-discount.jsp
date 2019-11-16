<%-- 
    Document   : list-discount
    Created on : Nov 3, 2019, 5:24:28 PM
    Author     : maimaimai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="../assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>
            Discount Code
        </title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <!-- CSS Files -->
        <link href="../assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet" />
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="../assets/demo/demo.css" rel="stylesheet" />
    </head>
    <body class="dark-edition">
        <div class="wrapper ">
            <div class="sidebar" data-color="purple" data-background-color="black" data-image="../assets/img/sidebar-2.jpg">
                <!--
                  Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"
          
                  Tip 2: you can also add an image using data-image tag
                -->
                <div class="logo"><a href="#" class="simple-text font-weight-bold text-warning logo-normal">
                        1849 Team
                    </a>
                </div>
                <div class="sidebar-wrapper">
                    <ul class="nav">
                        <li class="nav-item ">
                            <a class="nav-link" href="./index.jsp">
                                <i class="material-icons">dashboard</i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                        <!-- your sidebar here -->
                        <li class="nav-item ">
                            <a class="nav-link" href="./display-all-staff">
                                <i class="material-icons">person</i>
                                <p>Staff Manager</p>
                            </a>
                        </li>
                        <li class="nav-item active ">
                            <a class="nav-link" href="./list-discount-code">
                                <i class="material-icons">code</i>
                                <p>Discount Code</p>
                            </a>
                        </li>
                        <!--------->
                </div>
            </div>
            <div class="main-panel">
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " id="navigation-example">
                    <div class="container-fluid">
                        <div class="navbar-wrapper">
                            <a class="navbar-brand" href="javascript:void(0)"></a>
                        </div>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation" data-target="#navigation-example">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="navbar-toggler-icon icon-bar"></span>
                            <span class="navbar-toggler-icon icon-bar"></span>
                            <span class="navbar-toggler-icon icon-bar"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end">

                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="javascript:void(0)">
                                        <i class="material-icons">dashboard</i>
                                        <p class="d-lg-none d-md-block">
                                            Stats
                                        </p>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="javascript:void(0)">
                                        <i class="material-icons">person</i>
                                    </a>
                                </li>
                                <a href="/1849/logout">Logout</a>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- End Navbar -->
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <a href="create-discount-code" class="btn btn-info">create</a>
                        </div>
                        <div class="row">
                            <div class="col-md-12">

                                <div class="card">
                                    <div class="card-header card-header-primary">
                                        <h4 class="card-title ">Discount Code Manager</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <c:if test="${ empty list}">
                                                <h1>List discount is empty</h1>
                                            </c:if>
                                            <c:if test="${ not empty list}">
                                                <table class="table table-hover">
                                                    <thead class="">
                                                    <th class="text-info">Code</th>
                                                    <th class="text-info">Value (%)</th>
                                                    <th class="text-info">Delete</th>
                                                    </thead>
                                                    <c:forEach var="x" items="${list}">
                                                        <tbody>
                                                            <tr>
                                                                <td>${x.codeName}</td>
                                                                <td>${x.discountValue}</td>
                                                                <!--                                                                <td>
                                                                                                                                    <a data-target="#myModal" data-toggle="modal">
                                                                                                                                        <img src="../assets/img/delete.png" width="30" height="30"
                                                                                                                                    </a>
                                                                                                                                    <div tabidex="-1" class="modal fade" id="myModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
                                                                                                                                        <div class="modal-dialog">
                                                                s                                                                            <div class="modal-content">
                                                                                                                                                <div class="modal-header">
                                                                                                                                                    <h4 class="model-title"> Delete </h4>
                                                                                                                                                    <button type="button" class="close" data-dismiss="modal">
                                                                                                                                                        <span aria-hidden="true">&times;</span>
                                                                                                                                                    </button>
                                                                                                                                                </div>
                                                                                                                                                <div class="modal-body">
                                                                                                                                                    Are you sure delete discount code?
                                                                                                                                                </div>
                                                                                                                                                <div class="modal-footer">
                                                                                                                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancer</button>
                                                                                                                                                    <a href = "delete-discount-code?codename=${x.codeName}" class="btn btn-success">OK</a>
                                                                                                                                                    <button type="button" class="btn btn-success" onclick="send_delete()">OK</button>
                                                                                                                                                </div>
                                                                                                                                            </div>
                                                                                                                                        </div>
                                                                                                                                    </div>
                                                                                                                                </td>-->

                                                                <td><a href="delete-discount-code?codename=${x.codeName}"
                                                                       onclick="return confirm('Are you sure?')"/><img src="../assets/img/delete.png" width="20" height="20"</a></td>
                                                            </tr>
                                                        </tbody>    
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="footer">
                    <div class="container-fluid">
                        <nav class="float-left">
                            <ul>
                                <li>
                                    <a href="#">
                                        1849 team
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        About Us
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Blog
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Licenses
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <div class="copyright float-right" id="date">
                            , made with <i class="material-icons">favorite</i> by
                            <a href="#" target="_blank">1849 team</a> for a better web.
                        </div>
                    </div>
                </footer>
                <script>
                    const x = new Date().getFullYear();
                    let
                    date = document.getElementById('date');
                    date.innerHTML = '&copy; ' + x + date.innerHTML;
                </script>
            </div>
        </div>
        <div class="fixed-plugin">
            <div class="dropdown show-dropdown">
                <a href="#" data-toggle="dropdown">
                    <i class="fa fa-cog fa-2x"> </i>
                </a>
                <ul class="dropdown-menu">
                    <li class="header-title"> Sidebar Filters</li>
                    <li class="adjustments-line">
                        <a href="javascript:void(0)" class="switch-trigger active-color">
                            <div class="badge-colors ml-auto mr-auto">
                                <span class="badge filter badge-purple active" data-color="purple"></span>
                                <span class="badge filter badge-azure" data-color="azure"></span>
                                <span class="badge filter badge-green" data-color="green"></span>
                                <span class="badge filter badge-warning" data-color="orange"></span>
                                <span class="badge filter badge-danger" data-color="danger"></span>
                            </div>
                            <div class="clearfix"></div>
                        </a>
                    </li>
                    <li class="header-title">Images</li>
                    <li>
                        <a class="img-holder switch-trigger" href="javascript:void(0)">
                            <img src="../assets/img/sidebar-1.jpg" alt="">
                        </a>
                    </li>
                    <li class="active">
                        <a class="img-holder switch-trigger" href="javascript:void(0)">
                            <img src="../assets/img/sidebar-2.jpg" alt="">
                        </a>
                    </li>
                    <li>
                        <a class="img-holder switch-trigger" href="javascript:void(0)">
                            <img src="../assets/img/sidebar-3.jpg" alt="">
                        </a>
                    </li>
                    <li>
                        <a class="img-holder switch-trigger" href="javascript:void(0)">
                            <img src="../assets/img/sidebar-4.jpg" alt="">
                        </a>
                    </li>

                </ul>
            </div>
        </div>
        <!--   Core JS Files   -->
        <script src="../assets/js/core/jquery.min.js"></script>
        <script src="../assets/js/core/popper.min.js"></script>
        <script src="../assets/js/core/bootstrap-material-design.min.js"></script>
        <script src="https://unpkg.com/default-passive-events"></script>
        <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
        <!-- Place this tag in your head or just before your close body tag. -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>
        <!--  Google Maps Plugin    -->
        <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
        <!-- Chartist JS -->
        <script src="../assets/js/plugins/chartist.min.js"></script>
        <!--  Notifications Plugin    -->
        <script src="../assets/js/plugins/bootstrap-notify.js"></script>
        <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
        <script src="../assets/js/material-dashboard.js?v=2.1.0"></script>
        <!-- Material Dashboard DEMO methods, don't include it in your project! -->
        <script src="../assets/demo/demo.js"></script>
        <script>
                    $(document).ready(function () {
                        $().ready(function () {
                            $sidebar = $('.sidebar');

                            $sidebar_img_container = $sidebar.find('.sidebar-background');

                            $full_page = $('.full-page');

                            $sidebar_responsive = $('body > .navbar-collapse');

                            window_width = $(window).width();

                            $('.fixed-plugin a').click(function (event) {
                                // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
                                if ($(this).hasClass('switch-trigger')) {
                                    if (event.stopPropagation) {
                                        event.stopPropagation();
                                    } else if (window.event) {
                                        window.event.cancelBubble = true;
                                    }
                                }
                            });

                            $('.fixed-plugin .active-color span').click(function () {
                                $full_page_background = $('.full-page-background');

                                $(this).siblings().removeClass('active');
                                $(this).addClass('active');

                                var new_color = $(this).data('color');

                                if ($sidebar.length != 0) {
                                    $sidebar.attr('data-color', new_color);
                                }

                                if ($full_page.length != 0) {
                                    $full_page.attr('filter-color', new_color);
                                }

                                if ($sidebar_responsive.length != 0) {
                                    $sidebar_responsive.attr('data-color', new_color);
                                }
                            });

                            $('.fixed-plugin .background-color .badge').click(function () {
                                $(this).siblings().removeClass('active');
                                $(this).addClass('active');

                                var new_color = $(this).data('background-color');

                                if ($sidebar.length != 0) {
                                    $sidebar.attr('data-background-color', new_color);
                                }
                            });

                            $('.fixed-plugin .img-holder').click(function () {
                                $full_page_background = $('.full-page-background');

                                $(this).parent('li').siblings().removeClass('active');
                                $(this).parent('li').addClass('active');


                                var new_image = $(this).find("img").attr('src');

                                if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                                    $sidebar_img_container.fadeOut('fast', function () {
                                        $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                                        $sidebar_img_container.fadeIn('fast');
                                    });
                                }

                                if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                                    var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                                    $full_page_background.fadeOut('fast', function () {
                                        $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                                        $full_page_background.fadeIn('fast');
                                    });
                                }

                                if ($('.switch-sidebar-image input:checked').length == 0) {
                                    var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
                                    var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                                    $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                                    $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                                }

                                if ($sidebar_responsive.length != 0) {
                                    $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
                                }
                            });

                            $('.switch-sidebar-image input').change(function () {
                                $full_page_background = $('.full-page-background');

                                $input = $(this);

                                if ($input.is(':checked')) {
                                    if ($sidebar_img_container.length != 0) {
                                        $sidebar_img_container.fadeIn('fast');
                                        $sidebar.attr('data-image', '#');
                                    }

                                    if ($full_page_background.length != 0) {
                                        $full_page_background.fadeIn('fast');
                                        $full_page.attr('data-image', '#');
                                    }

                                    background_image = true;
                                } else {
                                    if ($sidebar_img_container.length != 0) {
                                        $sidebar.removeAttr('data-image');
                                        $sidebar_img_container.fadeOut('fast');
                                    }

                                    if ($full_page_background.length != 0) {
                                        $full_page.removeAttr('data-image', '#');
                                        $full_page_background.fadeOut('fast');
                                    }

                                    background_image = false;
                                }
                            });

                            $('.switch-sidebar-mini input').change(function () {
                                $body = $('body');

                                $input = $(this);

                                if (md.misc.sidebar_mini_active == true) {
                                    $('body').removeClass('sidebar-mini');
                                    md.misc.sidebar_mini_active = false;

                                    $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

                                } else {

                                    $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

                                    setTimeout(function () {
                                        $('body').addClass('sidebar-mini');

                                        md.misc.sidebar_mini_active = true;
                                    }, 300);
                                }

                                // we simulate the window Resize so the charts will get updated in realtime.
                                var simulateWindowResize = setInterval(function () {
                                    window.dispatchEvent(new Event('resize'));
                                }, 180);

                                // we stop the simulation of Window Resize after the animations are completed
                                setTimeout(function () {
                                    clearInterval(simulateWindowResize);
                                }, 1000);

                            });
                        });
                    });
        </script>
    </body>

</html>
