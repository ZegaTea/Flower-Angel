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
                        Quản lý trạng thái
                    </h4>						
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <%@ include file="include/add-status-modal.jsp" %>
                    <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Mã trạng thái</th>
                                <th>Tên trạng thái</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${listSt}">	
                                <tr>
                                    <td>${item.getId()}</td>										
                                    <td>${item.getStatus_name()}</td>
                                    <td>
                                        <div class="btn-action-table">
                                            <label onclick="showEditStatusModal('${item.getId()}')"><i
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

<%@ include file="include/edit-status-modal.jsp"%>
<script type="text/javascript">
    function showEditStatusModal(stId) {
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

