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
            <li><a href="${ctxPath}"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ</a> <i>/</i></li>
            <li>Đơn hàng</li>
        </ul>
    </div>
</div>

<c:choose>
    <c:when test="${sessionScope.user == null}">
        <c:choose>
            <c:when test="${listProductSingle.size() == 0}">
                <div class="panel-heading" align="center">Không có sản phẩm của đơn hàng ${invoiceId}</div>
            </c:when>
            <c:otherwise>
                <div id="wrapper">
                    <div id="page-wrapper">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading" align="center">
                                        Danh sách sản phẩm của đơn hàng ${invoiceId}
                                    </div>
                                    <div class="panel-body">
                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-listProductSingle">
                                            <thead>
                                                <tr>
                                                    <td>Tên sản phẩm</td>
                                                    <td>Giá sản phẩm</td>
                                                    <td>Số lượng</td>
                                                    <td>Giảm giá</td>
                                                    <td>Tổng tiền</td>
                                                    <td></td>
                                                </tr>
                                            </thead>
                                            <tbody class="table">
                                                <c:forEach var="cartItem" items="${listProductSingle}">
                                                    <tr>
                                                        <td><a href="${ctxPath}/san-pham/chi-tiet-${cartItem.getId()}">${cartItem.getProduct_name()}</a></td>
                                                        <td>$${cartItem.getPrice()}</td>
                                                        <td>${cartItem.getQuantity()}</td>
                                                        <td>${cartItem.getDiscount()}%</td>
                                                        <td>$${(cartItem.getPrice() * ((100 - cartItem.getDiscount()) / 100)) * cartItem.getQuantity()}</td>
                                                        <td><a href="${ctxPath}/san-pham/chi-tiet-${cartItem.getId()}">Chi tiết</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:otherwise>
        <div id="wrapper">
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading" align="center">
                                Danh sách đơn hàng của bạn
                            </div>
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-ListCart">
                                    <thead>
                                        <tr>
                                            <th style="width: 5%">Mã</th>
                                            <th>Tổng tiền</th>
                                            <th>Địa chỉ giao hàng</th>
                                            <th>Số điện thoại</th>
                                            <th>Ngày tạo</th>
                                            <th>Ngày thay đổi</th>
                                            <th>Trạng thái</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="cart" items="${listCartProduct}">
                                            <tr>
                                                <td>${cart.getId()}</td>
                                                <td>${cart.getTotal_cost()}</td>
                                                <td>${cart.getShipping_address()}</td>
                                                <td>${cart.getPhone_number()}</td>
                                                <td>${cart.getDate_create()}</td>
                                                <td>${cart.getDate_modify()}</td>
                                                <td>${cart.getStatus_name()}</td>
                                                <td><a data-toggle="modal" href="#cartModal-${cart.getId()}" >Chi tiết</a>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <c:forEach var="productCart" items="${listProduct}">

            <!-- Cart Modal -->
            <div class="container">
                <div class="row">
                    <div class="modal fade" id="cartModal-${productCart.getIdCart()}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Chi tiết đơn hàng ${productCart.getIdCart()}</h4>
                                </div>
                                <div class="modal-body">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-cart-${productCart.getIdCart()}" >
                                        <thead>
                                            <tr>
                                                <td>Tên sản phẩm</td>
                                                <td>Giá sản phẩm</td>
                                                <td>Số lượng</td>
                                                <td>Giảm giá</td>
                                                <td>Tổng tiền</td>
                                                <td></td>
                                            </tr>
                                        </thead>
                                        <tbody class="table">
                                            <c:forEach var="cartItem" items="${productCart.getListProduct()}">
                                                <tr>
                                                    <td><a href="${ctxPath}/san-pham/chi-tiet-${cartItem.getId()}">${cartItem.getProduct_name()}</a></td>
                                                    <td>$${cartItem.getPrice()}</td>
                                                    <td>${cartItem.getQuantity()}</td>
                                                    <td>${cartItem.getDiscount()}%</td>
                                                    <td>$${(cartItem.getPrice() * ((100 - cartItem.getDiscount()) / 100)) * cartItem.getQuantity()}</td>
                                                    <td><a href="${ctxPath}/san-pham/chi-tiet-${cartItem.getId()}">Chi tiết</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </div>
            </div>

            <!--    <script>
                    $(document).ready(function () {
                        $('#dataTables-cart-${productCart.getIdCart()}').DataTable({
                            responsive: true
                        });
                    });
                </script>-->
        </c:forEach> 
        <!-- End Cart Modal -->
    </c:otherwise>
</c:choose>            




<%@include file="../shared/footer.jsp"%>