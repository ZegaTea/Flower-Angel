<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ include file="../init.jsp"%>
<%@include file="../shared/header.jsp"%>
<%@include file="../shared/sidebar.jsp"%>

<div class="right_col" role="main">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>
                        Chi tiết đơn hàng số ${idCart}
                    </h2>						
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Mã sản phẩm</th>
                                <th>Tên sản phẩm</th>
                                <th>Ảnh</th>
                                <th>Giá</th>
                                <th>Khuyến mãi</th>
                                <th>Số lượng</th>
                                <th>Tổng tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${listCartDetail}">	
                                <tr>
                                    <td>${item.getId()}</td>										
                                    <td>${item.getProduct_name()}</td>
                                    <td>
                                        <c:if test="${item.getListImage().size() > 0}">
                                            <img src="${ctxImage}/${item.getListImage().get(0)}" style="width:70px;height:70px"/> 
                                        </c:if>
                                    </td>
                                    <td>$ ${item.getPrice()}</td>
                                    <td>${item.getDiscount()} %</td>										
                                    <td>${item.getQuantity()}</td>
                                    <td>$${(item.getPrice() * ((100 - item.getDiscount()) / 100)) * item.getQuantity()}</td>
                                </tr>
                            </c:forEach>								
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../shared/footer.jsp"%>

