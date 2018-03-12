<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ include file="../../init.jsp"%>

<!-- Cart Modal -->
<div class="container">
    <div class="row">
        <div class="modal fade" id="cartModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Giỏ hàng</h4>
                    </div>
                    <div class="modal-body">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example1" >
                            <thead>
                                <tr>
                                    <th>Tên sản phẩm</th>
                                    <th>Giá sản phẩm</th>
                                    <th style="width: 13%;" >Số lượng</th>
                                    <th>Giảm giá</th>
                                    <th>Tổng tiền</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody class="table">
                                <c:forEach var="cartItem" items="${sessionScope.cart}">
                                    <tr>
                                        <td><a href="${ctxPath}/san-pham/chi-tiet-${cartItem.getId()}">${cartItem.getProduct_name()}</a></td>
                                        <td>$${cartItem.getPrice()}</td>
                                        <td >
                                            <input class="txtQuantity" data-id="${cartItem.getId()}" style="width:100%" type="number" min="1" value="${cartItem.getQuantity()}" />
                                        </td>
                                        <td>${cartItem.getDiscount()}%</td>
                                        <td>$${(cartItem.getPrice() * ((100 - cartItem.getDiscount()) / 100)) * cartItem.getQuantity()}</td>
                                        <td><a href="${ctxPath}/san-pham/chi-tiet-${cartItem.getId()}">Chi tiết</a></td>
                                        <td><a href="${ctxPath}/san-pham/xoa-${cartItem.getId()}">Xóa</a></td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="4">Tổng số sản phẩm</td>
                                    <td>${sessionScope.cart.stream().map(x -> x.getQuantity()).reduce(0, (a,b) -> a + b)}</td>
                                    <td colspan="2"></td>

                                </tr>
                                <tr>
                                    <td colspan="4">Tổng tiền</td>
                                    <c:choose >
                                        <c:when test="${sessionScope.total == null}">
                                            <td>0</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>${sessionScope.total}</td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td colspan="2" rowspan="2" >
                                        <button align="center" type="button" class="btn btn-primary" onclick="updateCart()">Cập nhật giỏ hàng</button>
                                    </td>
                                </tr>
                                <c:choose>
                                    <c:when test="${sessionScope.user == null}">
                                        <tr>
                                            <td colspan="7" >
                                                <div align="center">
                                                    <a href="#" onclick="return document.getElementById('fastbuy').style.visibility = 'visible';" style="color: blue">Mua hàng ngay (Không cần đăng nhập)</a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="7" >
                                                <div align="center">
                                                    <a href="#" onclick="return $('#cartModal').modal('hide');" data-toggle="modal" data-target="#myModal88" title="Đăng nhập">Đăng nhập</a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="7" >
                                                <div align="center">
                                                    <a href="#" 
                                                       onclick="return document.getElementById('fastbuy').style.visibility = 'visible';" 
                                                       title="Thanh toán">Thanh toán</a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                        <c:choose>
                            <c:when test="${sessionScope.user == null}">
                                <form action="${ctxPath}/san-pham/thanh-toan" method="get">
                                    <div class="facts" style="visibility:hidden" id="fastbuy">
                                        <div class="register" >
                                            <input placeholder="Tên khách hàng" name="cusName" type="text"
                                                   required=""> 
                                            <input placeholder="Email"
                                                   name="cusEmail" type="text" required=""> 
                                            <input placeholder="Địa chỉ" name="cusAddress" type="text"
                                                   required=""> 
                                            <input placeholder="Số điện thoại"
                                                   name="cusPhone" type="text" required="">
                                            <div class="sign-up" align="center">
                                                <input type="submit" value="Đặt hàng" />
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <form action="${ctxPath}/san-pham/thanh-toan" method="get">
                                    <div class="facts" style="visibility:hidden" id="fastbuy">
                                        <div class="register" >
                                            <input placeholder="Tên khách hàng" name="cusName" type="text"
                                                   required="" value="${sessionScope.user.getName()}" readonly="true"> 
                                            <input placeholder="Email" value="${sessionScope.user.getEmail()}"
                                                   name="cusEmail" type="text" required="" readonly="true"> 
                                            <input placeholder="Địa chỉ" name="cusAddress" type="text"
                                                   required="" value="${sessionScope.user.getAddress()}"> 
                                            <input placeholder="Số điện thoại"
                                                   name="cusPhone" type="text" required="" value="${sessionScope.user.getPhone_number()}">
                                            <div class="sign-up" align="center">
                                                <input type="submit" value="Đặt hàng" />
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </div>
</div>

<!-- End Cart Modal -->