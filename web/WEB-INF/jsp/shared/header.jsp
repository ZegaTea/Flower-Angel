<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ include file="../init.jsp"%>

<%    List<Category> listCate = new CategoryDao().getAllCat();
    request.setAttribute("listCategory", listCate);
%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Flower Shop</title>
        <link rel="icon" href="${ctxPath}/resources/webpage/icon/icons8_Flowers.ico" > 
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords"
              content="Electronic Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              SmartPhone Compatible web template, free web designs for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript">

            addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } 

        </script>
        <!-- //for-mobile-apps -->
        <!-- Custom Theme files -->
        <link href="${ctxPath}/resources/client/css/bootstrap.css"
              rel="stylesheet" type="text/css" media="all" />
        <link href="${ctxPath}/resources/client/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="${ctxPath}/resources/client/css/fasthover.css" rel="stylesheet" type="text/css" media="all" />
        <link href="${ctxPath}/resources/client/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
        <!-- //Custom Theme files -->
        <!-- font-awesome icons -->
        <link href="${ctxPath}/resources/client/css/font-awesome.css" rel="stylesheet">
        <!-- //font-awesome icons -->
        <!-- js -->
        <script src="${ctxPath}/resources/client/js/jquery.min.js"></script>
        <link rel="stylesheet" href="${ctxPath}/resources/client/css/jquery.countdown.css" />
        <!-- countdown -->
        <!-- //js -->
        <!-- web fonts -->
        <link href='//fonts.googleapis.com/css?family=Glegoo:400,700' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
              rel='stylesheet' type='text/css'>
        <!-- //web fonts -->

        <link href="${ctxPath}/resources/admin/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet" />
        <link href="${ctxPath}/resources/admin/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet" />

       
        <!-- PNotify -->
        <link href="${ctxPath}/resources/admin/static/vendors/pnotify/dist/pnotify.css" rel="stylesheet">
        <link href="${ctxPath}/resources/admin/static/vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
        <link href="${ctxPath}/resources/admin/static/vendors/pnotify/dist/pnotify.nonblock.css" rel="stylesheet">

        <!-- start-smooth-scrolling -->
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({
                        scrollTop: $(this.hash).offset().top
                    }, 1000);
                });
            });
        </script>

        <c:if test="${sessionScope.buy == 1}">
            <script type="text/javascript">
                alert("Bạn đã đặt hàng thành công! Tiếp tục xem sản phẩm")
            </script>
            <c:remove var="buy" scope="session" ></c:remove>
        </c:if>
        <!-- //end-smooth-scrolling -->
    </head>
    <body>
        <!-- for bootstrap working -->
        <script type="text/javascript"
        src="${ctxPath}/resources/client/js/bootstrap-3.1.1.min.js"></script>
        <!-- //for bootstrap working -->
        <!-- header modal -->
        <div class="modal fade" id="myModal88" tabindex="-1" role="dialog"
             aria-labelledby="myModal88" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Don't Wait, Login now!</h4>
                        <h1 class="modal-title" style="visibility:hidden; color: red" id="warn">Thông tin tài khoản không chính xác, vui lòng kiểm tra lại</h1>
                    </div>
                    <div class="modal-body modal-body-sub">
                        <div class="row">
                            <div class="col-md-8 modal_body_left modal_body_left1"
                                 style="border-right: 1px dotted #C2C2C2; padding-right: 3em;">
                                <div class="sap_tabs">
                                    <div id="horizontalTab"
                                         style="display: block; width: 100%; margin: 0px;">
                                        <ul>
                                            <li class="resp-tab-item" aria-controls="tab_item-0"><span>Sign
                                                    in</span></li>
                                            <li class="resp-tab-item" aria-controls="tab_item-1"><span>Sign
                                                    up</span></li>
                                        </ul>
                                        <div class="tab-1 resp-tab-content"
                                             aria-labelledby="tab_item-0">
                                            <div class="facts">
                                                <div class="register">
                                                    <input name="Username" id="login-username"
                                                           placeholder="Username" type="text" required=""> 
                                                    <input name="Password" id="login-password"
                                                           placeholder="Password" type="password" required="">
                                                    <div class="sign-up">
                                                        <input type="submit" value="Sign in" class="btn-user-login" onclick="checkLogin()" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-2 resp-tab-content"
                                             aria-labelledby="tab_item-1">
                                            <div class="facts">
                                                <div class="register">
                                                    <form action="#" method="post">
                                                        <input placeholder="Name" name="Name" type="text"
                                                               required=""> 
                                                        <input placeholder="Username"
                                                               name="Email" type="email" required=""> 
                                                        <input placeholder="Password" name="Password" type="password"
                                                               required=""> 
                                                        <input placeholder="Confirm Password"
                                                               name="Password" type="password" required="">
                                                        <div class="sign-up">
                                                            <input type="submit" value="Create Account" />
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <script
                                    src="${ctxPath}/resources/client/js/easyResponsiveTabs.js"
                                type="text/javascript"></script>
                                <script type="text/javascript">
                $(document).ready(function () {
                    $('#horizontalTab').easyResponsiveTabs({
                        type: 'default', //Types: default, vertical, accordion           
                        width: 'auto', //auto or any width like 600px
                        fit: true
                                // 100% fit in a container
                    });
                });
                                </script>
                                <div id="OR" class="hidden-xs">OR</div>
                            </div>
                            <div class="col-md-4 modal_body_right modal_body_right1">
                                <div class="row text-center sign-with">
                                    <div class="col-md-12">
                                        <h3 class="other-nw">Sign in with</h3>
                                    </div>
                                    <div class="col-md-12">
                                        <ul class="social">
                                            <li class="social_facebook"><a href="#"
                                                                           class="entypo-facebook"></a></li>
                                            <li class="social_dribbble"><a href="#"
                                                                           class="entypo-dribbble"></a></li>
                                            <li class="social_twitter"><a href="#"
                                                                          class="entypo-twitter"></a></li>
                                            <li class="social_behance"><a href="#"
                                                                          class="entypo-behance"></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- header modal -->
        <!-- header -->
        <div class="header" id="home1">
            <div class="container">
                <div class="w3l_login">
                    <c:choose>
                        <c:when test="${sessionScope.user == null}">
                            <a href="#" data-toggle="modal" data-target="#myModal88" title="Đăng nhập"><span
                                    class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
                            </c:when>
                            <c:otherwise>
                            <a href="#" onclick="return logOut()"  title="Đăng xuất"><span
                                    class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a>
                            <h4 >Xin chào: ${sessionScope.user.getName()}</h4>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="w3l_logo">
                    <h1>
                        <a href="${ctxpath}">Flower's Angel<span>Your stores.
                                Your flower.</span></a>
                    </h1>
                </div>
                <div class="search">
                    <input class="search_box" type="checkbox" id="search_box"> <label
                        class="icon-search" for="search_box"><span
                            class="glyphicon glyphicon-search" aria-hidden="true"></span></label>
                    <div class="search_form">
                        <form action="#" method="post">
                            <input type="text" name="Search" placeholder="Search..." style="width: 362px;">
                            <input type="submit" value="Send">
                        </form>
                    </div>
                </div>
                <div class="cart cart box_1">
                    <button class="w3view-cart"  name="submit" value="" >
                        <a data-toggle="modal" href="#cartModal" >
                            <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                        </a>
                    </button>
                </div>
            </div>
        </div>

        <!-- Cart Modal -->
        <%@ include file="include/cart-modal.jsp"%>

        <!-- End Cart Modal -->
        <!-- //header -->
        <!-- navigation -->
        <div class="navigation">
            <div class="container">
                <nav class="navbar navbar-default">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header nav_2">
                        <button type="button"
                                class="navbar-toggle collapsed navbar-toggle1"
                                data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                            <span class="sr-only">Toggle navigation</span> <span
                                class="icon-bar"></span> <span class="icon-bar"></span> <span
                                class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                        <ul class="nav navbar-nav">
                            <li><a href="${ctxPath}" class="act">Trang chủ</a></li>
                            <!-- Mega Menu -->
                            <li class="dropdown"><a href="#" class="dropdown-toggle"
                                                    data-toggle="dropdown">Danh mục <b class="caret"></b></a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <ul class="multi-column-dropdown">
                                                <h6>Danh muc</h6> 
                                                <c:forEach var="item" items="${listCategory}">
                                                    <li><a href="${ctxPath}/danh-muc/${item.getCategory_path()}/page-1">${item.getCategory_name()}</a></li>
                                                    </c:forEach>
                                            </ul>
                                        </div>

                                        <div class="col-sm-4">
                                            <div class="w3ls_products_pos">
                                                <h4>
                                                    30%<i>Off/-</i>
                                                </h4>
                                                <img src="${ctxPath}/resources/client/images/1.jpg" alt=" "
                                                     class="img-responsive" />
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </ul></li>

                            <c:choose>
                                <c:when test="${sessionScope.user != null}">
                                    <li><a href="${ctxPath}/san-pham/don-hang">Lịch sử đặt hàng</a></li>
                                    </c:when>
                                    <c:otherwise>

                                    <li><a href="#" onclick="return $('#search-cart-id-form').modal('show');">Tìm đơn hàng</a></li>
                                    </c:otherwise>
                                </c:choose>
                            <li><a href="about.html">About Us</a></li>

                            <li><a href="mail.html">Mail Us</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <%@ include file="include/show-search-modal.jsp"%>
        <!-- //navigation -->