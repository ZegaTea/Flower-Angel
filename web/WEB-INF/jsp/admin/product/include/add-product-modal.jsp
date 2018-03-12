<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add-product-form">Thêm sản phẩm</button>

<div class="modal fade bs-example-modal-lg" id="add-product-form" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form method="GET" action="${ctxPath}/admin/san-pham/them-moi" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" enctype="multipart/form-data">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Thêm sản phẩm</h4>
                </div>

                <div class="modal-body col-md-12 col-sm-12">
                    <div class="col-md-9 col-sm-9">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Tên sản phẩm <span class="required">*</span>
                            </label>
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="proName" name="proName" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Danh mục</label>
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <c:forEach var="item" items="${listCat}">
                                    <div class="checkbox col-md-3 col-sm-3 col-xs-12">
                                        <label><input type="checkbox" id="cate${item.getId()}" name="proCat" value="${item.getId()}">${item.getCategory_name()}</label>
                                    </div>
                                </c:forEach>
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Giá <span class="required">*</span>
                            </label>
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="number" id="proPrice" name="proPrice" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Khuyến mại <span class="required">*</span>
                            </label>
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="number" min="0" max="100" value="0" id="proDiscount" name="proDiscount" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Mô tả ngắn gọn <span class="required">*</span>
                            </label>
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <input type="text" id="proSort" name="proSort" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Mô tả đầy đủ</label>
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <textarea id="proFull" class="form-control col-md-7 col-xs-12" name="proFull"></textarea>
                            </div>
                        </div>	
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="col-md-12 col-sm-12">
                            <img src="${ctxPath}/resources/client/product_image/images/bo-hoa/B0001.jpg"  style="width:100%;height:100%"/>
                        </div>
                        
                    </div>
                </div>


                <div class="modal-footer col-md-12 col-sm-12">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Lưu lại</button>
                </div>


            </form>
        </div>

    </div>
</div>