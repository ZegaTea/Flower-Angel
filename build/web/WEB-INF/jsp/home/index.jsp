<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ include file="../init.jsp"%>
<%@include file="../shared/header.jsp"%>


<!-- banner -->
<div class="banner">
    <div class="container">
        <h3>Flower Store,  <span>Special Offers</span></h3>
    </div>

</div>

<div class="breadcrumb_dress">
    <div class="container">
        <ul>
            <li><a href="${ctxPath}"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ</a> <i>/</i></li>
        </ul>
    </div>
</div>

<!-- new-products -->
<div class="new-products">
    <div class="container">
        <h3>New Products ${new_product.size()}</h3>
        <div class="agileinfo_new_products_grids">
            <c:forEach var="item" items="${new_product}" >
                <div class="col-md-3 agileinfo_new_products_grid">
                    <div class="agile_ecommerce_tab_left agileinfo_new_products_grid1">
                        <div class="hs-wrapper hs-wrapper1">
                            <c:forEach var="imag" items="${item.getListImage()}">
                                <img src="${ctxImage}/${imag}" alt="null" class="img-responsive" />
                            </c:forEach>


                            <div class="w3_hs_bottom w3_hs_bottom_sub">
                                <ul>
                                    <li>
                                        <a href="#" data-toggle="modal" data-target="#myModal${item.getId()}">
                                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <h5>
                            <a href="${ctxPath}/san-pham/chi-tiet-${item.getId()}">${item.getProduct_name()}</a>
                        </h5>
                        <div class="simpleCart_shelfItem">
                            <p>
                                <c:if test="${item.getDiscount() > 0}">
                                    <span>$${item.getPrice()}</span>
                                </c:if>
                                <i class="item_price">$${item.getPrice() * ((100 - item.getDiscount()) / 100)}</i>
                            </p>

                            <button   onclick="addCartDefault('${item.getId()}')">Add to cart</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- //new-products -->



<!-- modal-video -->
<c:forEach var="item" items="${new_product}" >
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
                                <button   onclick="addCartDefault('${item.getId()}')">Add to cart</button>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</c:forEach>


<!-- //modal-video -->


<!-- top-brands -->
<div class="top-brands">
    <div class="container">
        <h3>Top Brands</h3>
        <div class="sliderfig">
            <ul id="flexiselDemo1">
                <li><img src="${ctxPath}/resources/client/images/tb1.jpg"
                         alt=" " class="img-responsive" /></li>
                <li><img src="${ctxPath}/resources/client/images/tb2.jpg"
                         alt=" " class="img-responsive" /></li>
                <li><img src="${ctxPath}/resources/client/images/tb3.jpg"
                         alt=" " class="img-responsive" /></li>
                <li><img src="${ctxPath}/resources/client/images/tb4.jpg"
                         alt=" " class="img-responsive" /></li>
                <li><img src="${ctxPath}/resources/client/images/tb5.jpg"
                         alt=" " class="img-responsive" /></li>
            </ul>
        </div>
        <script type="text/javascript">
            $(window).load(function () {
                $("#flexiselDemo1").flexisel({
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
        <script type="text/javascript"
        src="${ctxPath}/resources/client/js/jquery.flexisel.js"></script>
    </div>
</div>
<!-- //top-brands -->
<!-- newsletter -->


<%@include file="../shared/footer.jsp"%>