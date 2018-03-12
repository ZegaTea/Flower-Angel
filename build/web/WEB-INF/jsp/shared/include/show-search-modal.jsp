<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>

<div class="modal fade bs-example-modal-lg" id="search-cart-id-form" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form method="GET" action="${ctxPath}/admin/trang-thai/them-moi" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" enctype="multipart/form-data">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Tìm kiếm đơn hàng</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Nhập mã đơn hàng <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="stName" name="stName" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                        </div>
                    </div>

                </div>


                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>