<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ include file="../init.jsp"%>
<%@include file="../shared/header.jsp"%>
<%@include file="../shared/sidebar.jsp"%>


<div class="right_col" role="main">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h4>
                        Quản lý đơn hàng
                    </h4>						
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 5%">Mã đơn hàng</th>
                                <th>Email người đặt</th>
                                <th>Tổng tiền</th>
                                <th>Trạng thái</th>
                                <th>Địa chỉ giao hàng</th>
                                <th>Số điện thoại</th>
                                <th>Ngày tạo</th>
                                <th>Ngày thay đổi</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${listCart}">	
                                <tr>
                                    <td>${item.getId()}</td>										
                                    <td>${item.getEmail()}</td>
                                    <td>${item.getTotal_cost()}</td>										
                                    <td>${item.getStatus_name()}</td>
                                    <td>${item.getShipping_address()}</td>										
                                    <td>${item.getPhone_number()}</td>
                                    <td>${item.getDate_create()}</td>										
                                    <td>${item.getDate_modify()}</td>
                                    <td><a href="${ctxPath}/admin/don-hang/chi-tiet-${item.getId()}">Chi tiết</a></td>
                                    <td>
                                        <div class="btn-action-table">
                                            <label onclick="showEditCartModal('${item.getId()}')"><i
                                                    class="fa fa-edit"></i></label>
                                        </div>
                                        
                                    </td>
                                </tr>
                            </c:forEach>								
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="include/edit-cart-modal.jsp"%>
<script type="text/javascript">
    function showEditCartModal(stId) {
        $.ajax({
            url: "${ctxPath}/admin/trang-thai/tim-kiem",
            type: "GET",
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            data: {
                id: stId,
            },
            success: function (status) {
                $("#editCategoryForm #stId").val(status.id);
                $("#editCategoryForm #stName").val(status.status_name);
                $("#editCategory").modal("show");
            },
            error: function (e) {
                alert("Error")
            }
        });
    }


</script>



<%@include file="../shared/footer.jsp"%>

