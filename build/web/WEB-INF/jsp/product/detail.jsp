<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ include file="../init.jsp"%>
<%@include file="../shared/header.jsp"%>

<div class="breadcrumb_dress">
    <div class="container">
        <ul>
            <li><a href="${ctxPath}"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ</a> <i>/</i></li>
            <li>Chi tiết</li>
        </ul>
    </div>
</div>

<div class="single">
    <div class="container">
        <div class="col-md-4 single-left">
            <div class="flexslider">
                <ul class="slides">
                    <c:forEach var="imagedetail" items="${productDetail.getListImage()}">
                        <li data-thumb="${ctxImage}/${imagedetail}">
                            <div class="thumb-image"> <img src="${ctxImage}/${imagedetail}" data-imagezoom="true" class="img-responsive" alt=""> </div>
                        </li>
                    </c:forEach>


                </ul>
            </div>
            <!-- flexslider -->
            <script defer src="${ctxPath}/resources/client/js/jquery.flexslider.js"></script>
            <link rel="stylesheet" href="${ctxPath}/resources/client/css/flexslider.css" type="text/css" media="screen" />
            <script>
                // Can also be used with $(document).ready()
                $(window).load(function () {
                    $('.flexslider').flexslider({
                        animation: "slide",
                        controlNav: "thumbnails"
                    });
                });
            </script>
            <!-- flexslider -->
            <!-- zooming-effect -->
            <script src="${ctxPath}/resources/client/js/imagezoom.js"></script>
            <!-- //zooming-effect -->
        </div>
        <div class="col-md-8 single-right">
            <h3>${productDetail.getProduct_name()}</h3>
            <div class="rating1">
                <span class="starRating">
                    <input id="rating5" type="radio" name="rating" value="5">
                    <label for="rating5">5</label>
                    <input id="rating4" type="radio" name="rating" value="4">
                    <label for="rating4">4</label>
                    <input id="rating3" type="radio" name="rating" value="3" checked>
                    <label for="rating3">3</label>
                    <input id="rating2" type="radio" name="rating" value="2">
                    <label for="rating2">2</label>
                    <input id="rating1" type="radio" name="rating" value="1">
                    <label for="rating1">1</label>
                </span>
            </div>
            <div class="description">
                <h5><i>Mô tả</i></h5>
                <p>${productDetail.getFull_description()}</p>
            </div>
            <form action="${ctxPath}/san-pham/them-gio-hang" method="get">
                <div class="color-quality">

                    <div class="color-quality-right">
                        <h5>Số lượng :</h5>
                        <div class="quantity"> 
                            <div class="quantity-select">                           
                                <div class="entry value-minus1">&nbsp;</div>
                                <div class="entry value1"> <span>1</span></div>
                                <input type="hidden" name="quantity" value="1" id="productQuantity"/>
                                <input type="hidden" name="id" value="${productDetail.getId()}" id="productId" />
                                <div class="entry value-plus1 active">&nbsp;</div>
                            </div>
                        </div>
                        <!--quantity-->
                        <script>
                $('.value-plus1').on('click', function () {
                    var divUpd = $(this).parent().find('.value1'), newVal = parseInt(divUpd.text(), 10) + 1;
                    divUpd.text(newVal);
                    document.getElementById('productQuantity').value = newVal;
                });

                $('.value-minus1').on('click', function () {
                    var divUpd = $(this).parent().find('.value1'), newVal = parseInt(divUpd.text(), 10) - 1;
                    if (newVal >= 1) {
                        divUpd.text(newVal);
                        document.getElementById('productQuantity').value = newVal;
                    }
                });
                        </script>
                        <!--quantity-->

                    </div>
                    <div class="clearfix"> </div>
                </div>

                <div class="simpleCart_shelfItem">
                    <p>
                        <c:if test="${productDetail.getDiscount() > 0}">
                            <span>$${productDetail.getPrice()}</span>
                        </c:if>
                        <i class="item_price">$${productDetail.getPrice() * ((100 - productDetail.getDiscount()) / 100)}</i>
                    </p>

                    <button type="submit" class="w3ls-cart">Thêm vào giỏ hàng</button>

                </div> 
            </form>
        </div>
        <div class="clearfix"> </div>
    </div>
</div> 
<div class="additional_info">
    <div class="container">
        <div class="sap_tabs">	
            <div id="horizontalTab1" style="display: block; width: 100%; margin: 0px;">
                <ul>
                    <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Product Information</span></li>
                </ul>		
                <div class="tab-1 resp-tab-content additional_info_grid" aria-labelledby="tab_item-0">
                    <h3>${productDetail.getProduct_name()}</h3>
                    <p>${productDetail.getFull_description()}</p>
                </div>	

            </div>	
        </div>
        <script src="${ctxPath}/resources/client/js/easyResponsiveTabs.js" type="text/javascript"></script>
        <script type="text/javascript">
                $(document).ready(function () {
                    $('#horizontalTab1').easyResponsiveTabs({
                        type: 'default', //Types: default, vertical, accordion           
                        width: 'auto', //auto or any width like 600px
                        fit: true   // 100% fit in a container
                    });
                });
        </script>
    </div>
</div>

<!-- Related Products -->
<div class="w3l_related_products">
    <div class="container">
        <h3>${listRela.size()} Sản phẩm cùng danh mục</h3>
        <ul id="flexiselDemo2">	
            <c:forEach var="itemRela" items="${listRela}">
                <li>
                    <div class="w3l_related_products_grid">
                        <div class="agile_ecommerce_tab_left mobiles_grid">
                            <div class="hs-wrapper hs-wrapper3">
                                <c:forEach var="imagRela" items="${itemRela.getListImage()}">
                                    <img src="${ctxImage}/${imagRela}" alt="null" class="img-responsive" />
                                </c:forEach>
                                <div class="w3_hs_bottom">
                                    <div class="flex_ecommerce">
                                        <a href="#" data-toggle="modal" data-target="#myModal${itemRela.getId()}">
                                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <h5>
                                <a href="${ctxPath}/san-pham/chi-tiet-${itemRela.getId()}">${itemRela.getProduct_name()}</a>
                            </h5>
                            <div class="simpleCart_shelfItem">
                                <p>
                                    <c:if test="${itemRela.getDiscount() > 0}">
                                        <span>$${itemRela.getPrice()}</span>
                                    </c:if>
                                    <i class="item_price">$${itemRela.getPrice() * ((100 - itemRela.getDiscount()) / 100)}</i>
                                </p>
                                <button   onclick="addCartDefault('${itemRela.getId()}')">Add to cart</button>
                            </div>
                        </div>
                    </div>
                </li>
            </c:forEach>

        </ul>

        <script type="text/javascript">
            $(window).load(function () {
                $("#flexiselDemo2").flexisel({
                    visibleItems: 4,
                    animationSpeed: 1000,
                    autoPlay: true,
                    autoPlaySpeed: 3000,
                    pauseOnHover: true,
                    enableResponsiveBreakpoints: true,
                    responsiveBreakpoints: {
                        portrait: {
                            changePoint: 480,
                            visibleItems: 1
                        },
                        landscape: {
                            changePoint: 640,
                            visibleItems: 2
                        },
                        tablet: {
                            changePoint: 768,
                            visibleItems: 3
                        }
                    }
                });

            });
        </script>
        <script type="text/javascript" src="${ctxPath}/resources/client/js/jquery.flexisel.js"></script>
    </div>
</div>
<!-- //Related Products -->

<!-- Modal -->
<c:forEach var="item" items="${listRela}">
    <div class="modal video-modal fade" id="myModal${item.getId()}" tabindex="-1" role="dialog" aria-labelledby="myModal${item.getId()}">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                </div>
                <section>
                    <div class="modal-body">
                        <div class="col-md-5 modal_body_left">
                            <c:if test="${item.getListImage().size() > 0}">
                                <img src="${ctxImage}/${item.getListImage().get(0)}" alt=" " class="img-responsive" />
                            </c:if>
                        </div>
                        <div class="col-md-7 modal_body_right">
                            <h4>${item.getProduct_name()}</h4>
                            <p>${item.getFull_description()}</p>
                            <div class="rating">
                                <div class="rating-left">
                                    <img src="${ctxPath}/resources/client/images/star-.png" alt=" " class="img-responsive" />
                                </div>
                                <div class="rating-left">
                                    <img src="${ctxPath}/resources/client/images/star-.png" alt=" " class="img-responsive" />
                                </div>
                                <div class="rating-left">
                                    <img src="${ctxPath}/resources/client/images/star-.png" alt=" " class="img-responsive" />
                                </div>
                                <div class="rating-left">
                                    <img src="${ctxPath}/resources/client/images/star.png" alt=" " class="img-responsive" />
                                </div>
                                <div class="rating-left">
                                    <img src="${ctxPath}/resources/client/images/star.png" alt=" " class="img-responsive" />
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="modal_body_right_cart simpleCart_shelfItem">
                                <p>
                                    <c:if test="${item.getDiscount() > 0}">
                                        <span>$${item.getPrice()}</span>
                                    </c:if>
                                    <i class="item_price">$${item.getPrice() * ((100 - item.getDiscount()) / 100)}</i>
                                </p>
                                <form action="#" method="post">
                                    <button type="submit" class="w3ls-cart">Add to cart</button>
                                </form>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</c:forEach>

<%@include file="../shared/footer.jsp"%>
