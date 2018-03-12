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
                        Quản lý <small>Danh mục</small>
                    </h2>						
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <%@ include file="include/add-category-modal.jsp" %>
                    <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Mã danh mục</th>
                                <th>Tên danh mục</th>
                                <th>Đường dẫn</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${listCat}">	
                                <tr>
                                    <td>${item.getId()}</td>										
                                    <td>${item.getCategory_name()}</td>
                                    <td>${item.getCategory_path()}</td>
                                    <td>
                                        <div class="btn-action-table">
                                            <label onclick="showEditCategoryModal('${item.getId()}')"><i
                                                    class="fa fa-edit"></i></label>
                                        </div>
                                        <div class="btn-action-table">
                                            <label onclick="deleteCategory('${item.getId()}')"><i
                                                    class="fa fa-remove"></i></label>
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

<%@ include file="include/edit-category-modal.jsp"%>
<script type="text/javascript">
    function showEditCategoryModal(cateId) {
        $.ajax({
            url: "${ctxPath}/admin/danh-muc/tim-kiem",
            type: "GET",
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            data: {
                id: cateId,
            },
            success: function (category) {
                $("#editCategoryForm #cateId").val(category.id);
                $("#editCategoryForm #cateName").val(category.category_name);
                $("#editCategoryForm #catePath").val(category.category_path);
                $("#editCategory").modal("show");
            },
            error: function (e) {
                alert("Error")
            }
        });
    }

    function deleteCategory(id) {
        var r = confirm("Bạn có chắc chắn muốn xoá danh mục " + id);
        if (r == true) {
            $.ajax({
                url: "${ctxPath}/admin/danh-muc/xoa",
                type: "GET",
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                data: {
                    cateId: id
                },
                success: function (res) {
                    if (res.msg == "success") {

                        new PNotify({
                            title: 'Thành công',
                            text: 'Chỉnh sửa danh mục thành công!',
                            type: 'success',
                            styling: 'bootstrap3'
                        });
                        window.location.reload();
                    } else {
                        new PNotify({
                            title: 'Không thành công',
                            text: 'Xóa danh mục không thành công!',
                            type: 'Error',
                            styling: 'bootstrap3'
                        });
                    }
                },
                error: function (e) {
                    alert("error")
                }
            });
        }
    }

</script>



<%@include file="../shared/footer.jsp"%>

