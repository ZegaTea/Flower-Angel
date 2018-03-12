<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ include file="../init.jsp"%>
<%@include file="../shared/header.jsp"%>


<div class="banner banner2">
    <div class="container">

    </div>
</div> 
<div class="breadcrumb_dress">
    <div class="container">
        <ul>
            <li><a href="${ctxPath}"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ </a> <i>/</i></li>
            <li> Danh mục <i>/</i></li>
            <li>${nameCat}</li>
        </ul>
    </div>
</div>

<div class="mobiles">
    <div class="container">
        <div class="w3ls_mobiles_grids">
            <div class="col-md-4 w3ls_mobiles_grid_left">
                <div class="w3ls_mobiles_grid_left_grid">
                    <h3>Danh mục</h3>
                    <div class="w3ls_mobiles_grid_left_grid_sub">
                        <ul class="panel_bottom">
                            <c:forEach var="cat" items="${listCategory}">
                                <li><a href="${ctxPath}/danh-muc/${cat.getCategory_path()}/page-1">${cat.getCategory_name()}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-8 w3ls_mobiles_grid_right">
                <div class="w3ls_mobiles_grid_right_grid2">
                    <div class="w3ls_mobiles_grid_right_grid2_left">
                        <h3>Showing Results: 0-1</h3>
                    </div>
                    <div class="w3ls_mobiles_grid_right_grid2_right">
                        <select name="select_item" class="select_item">
                            <option selected="selected">Default sorting</option>
                            <option>Sort by popularity</option>
                            <option>Sort by average rating</option>
                            <option>Sort by newness</option>
                            <option>Sort by price: low to high</option>
                            <option>Sort by price: high to low</option>
                        </select>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-12 w3ls_mobiles_grids">
                    <c:forEach var="product" items="${listProductCat}">
                        <div class="col-md-4 agileinfo_new_products_grid agileinfo_new_products_grid_mobiles">
                            <div class="agile_ecommerce_tab_left mobiles_grid">
                                <div class="hs-wrapper hs-wrapper2">
                                    <c:forEach var="imag" items="${product.getListImage()}">
                                        <img src="${ctxImage}/${imag}" alt="null" class="img-responsive" />
                                    </c:forEach> 
                                    <div class="w3_hs_bottom w3_hs_bottom_sub1">
                                        <ul>
                                            <li>
                                                <a href="#" data-toggle="modal" data-target="#myModal${product.getId()}"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <h5>
                                    <a href="${ctxPath}/san-pham/chi-tiet-${product.getId()}">${product.getProduct_name()}</a>
                                </h5> 
                                <div class="simpleCart_shelfItem">
                                    <p>
                                        <c:if test="${product.getDiscount() > 0}">
                                            <span>$${product.getPrice()}</span>
                                        </c:if>
                                        <i class="item_price">$${product.getPrice() * ((100 - product.getDiscount()) / 100)}</i>
                                    </p>

                                    <button   onclick="addCartDefault('${product.getId()}')">Add to cart</button>
                                </div> 

                            </div>
                        </div>
                    </c:forEach>

                </div>

                <div class="col-md-12 w3ls_mobiles_grids" align="center">
                    <nav>
                        <ul class="pagination">
                            <c:if test="${Page > First}">
                                <li>
                                    <a href="${ctxPath}/danh-muc/${pathCat}/page-${First}" title="Trang đầu" class="first"><i class="fa fa-angle-double-left"></i></a>
                                </li>
                                <li>
                                    <a href="${ctxPath}/danh-muc/${pathCat}/page-${Prev}" title="Trang trước" class="prev"><i class="fa fa-angle-left"></i></a>
                                </li>
                            </c:if>
                            <c:forEach var="i" varStatus="loop" begin="${startPageIndex}" end="${endPageIndex}" step="1">
                                <c:choose>
                                    <c:when test="${Page == i}">
                                        <li> <a href="${ctxPath}/danh-muc/${pathCat}/page-${i}" class="active" title="Trang hiện tại"><b><u>${i}</u></b></a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                        <li><a href="${ctxPath}/danh-muc/${pathCat}/page-${i}" class="pos" title="Trang ${i}" >${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>


                            </c:forEach>
                            <c:if test="${Page < TotalPage}">
                                <li><a href="${ctxPath}/danh-muc/${pathCat}/page-${Next}" class="next" title="Trang sau"><i class="fa fa-angle-right"></i></a></li>
                                <li> <a href="${ctxPath}/danh-muc/${pathCat}/page-${Last}" class="last" title="Trang cuối"><i class="fa fa-angle-double-right"></i></a></li>
                                    </c:if>

                        </ul>
                    </nav>
                    <div class="clearfix"> </div>
                </div>


            </div>

            <div class="clearfix"> </div>
        </div>
    </div>
</div> 

<c:forEach var="item" items="${listProductCat}" >
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


<%@include file="../shared/footer.jsp"%>
