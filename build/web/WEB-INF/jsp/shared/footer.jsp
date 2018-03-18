<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         language="java"%>
<%@ include file="../init.jsp"%>

<div class="newsletter">
    <div class="container">
        <div class="col-md-6 w3agile_newsletter_left">
            <h3>Email us: </h3>
            <p>============================================></p>
        </div>
        <div class="col-md-6 w3agile_newsletter_right">
            <form action="#" method="post">
                <input type="email" name="Email" placeholder="Email" required="">
                <input type="submit" value="" />
            </form>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //newsletter -->
<!-- footer -->
<div class="footer">
    <div class="container">
        <div class="w3_footer_grids">
            <div class="col-md-3 w3_footer_grid">
                <h3>Contact</h3>
                <p>Duis aute irure dolor in reprehenderit in voluptate velit
                    esse.</p>
                <ul class="address">
                    <li><i class="glyphicon glyphicon-map-marker"
                           aria-hidden="true"></i>236 Hoàng Quốc Việt<span>Hà Nội</span></li>
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a
                            href="mailto:info@example.com">admin@flower-angel.com</a></li>
                    <li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+1234
                        567 567</li>
                </ul>
            </div>
            <div class="col-md-3 w3_footer_grid">
                <h3>Information</h3>
                <ul class="info">
                    <li><a href="about.html">About Us</a></li>
                    <li><a href="mail.html">Contact Us</a></li>
                    <li><a href="codes.html">Short Codes</a></li>
                    <li><a href="faq.html">FAQ's</a></li>
                    <li><a href="products.html">Special Products</a></li>
                </ul>
            </div>
            <div class="col-md-3 w3_footer_grid">
                <h3>Category</h3>
                <ul class="info">
                    <li><a href="products.html">Mobiles</a></li>
                    <li><a href="products1.html">Laptops</a></li>
                    <li><a href="products.html">Purifiers</a></li>
                    <li><a href="products1.html">Wearables</a></li>
                    <li><a href="products2.html">Kitchen</a></li>
                </ul>
            </div>
            <div class="col-md-3 w3_footer_grid">
                <h3>Profile</h3>
                <ul class="info">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="products.html">Today's Deals</a></li>
                </ul>
                <h4>Follow Us</h4>
                <div class="agileits_social_button">
                    <ul>
                        <li><a href="#" class="facebook"> </a></li>
                        <li><a href="#" class="twitter"> </a></li>
                        <li><a href="#" class="google"> </a></li>
                        <li><a href="#" class="pinterest"> </a></li>
                    </ul>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="footer-copy">
        <div class="footer-copy1">
            <div class="footer-copy-pos">
                <a href="#home1" class="scroll"><img
                        src="${ctxPath}/resources/client/images/arrow.png" alt=" "
                        class="img-responsive" /></a>
            </div>
        </div>
        <div class="container">
            <p>
                &copy; 2017 Flower Store. All rights reserved | Design by <a
                    href="http://w3layouts.com/">W3layouts</a>
            </p>
        </div>
    </div>
</div>
<!-- //footer -->

<!-- cart-js -->
<script src="${ctxPath}/resources/client/js/minicart.js"></script>
<script>
    w3ls.render();

    w3ls.cart.on('w3sb_checkout', function (evt) {
        var items, len, i;

        if (this.subtotal() > 0) {
            items = this.items();

            for (i = 0, len = items.length; i < len; i++) {
            }
        }
    });
</script>

<script src="${ctxPath}/resources/admin/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="${ctxPath}/resources/admin/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="${ctxPath}/resources/admin/vendor/datatables-responsive/dataTables.responsive.js"></script>



<script>
    $(document).ready(function () {
        $('#dataTables-example1').DataTable({
            responsive: true
        });
    });
</script>
<c:if test="${sessionScope.buying != null}" >
    <script>
        $('#cartModal').modal('show')
    </script>
</c:if>

<script>
    function signUp() {
        var pass1 = $('#register-pass').val()
        var pass2 = $('#register-pass-confirm').val()

        if (pass1 != pass2) {
            $('#warn').text("Mật khẩu không trùng khớp")
        } else {
            $.ajax({
                url: '${ctxPath}/user/register',
                type: "GET",
                contentType: "application/json",
                dataType: 'json',
                data: {
                    username: $('#register-username').val(),
                    password: $('#register-pass').val(),
                    name: $('#register-name').val(),
                    email: $('#register-email').val(),
                    phone: $('#register-phone').val(),
                    address: $('#register-address').val()
                },
                success: function (data) {
                    if (data.msg == "success") {
                        alert("Đăng ký tài khoản thành công");
                        window.location.reload();
                    } else {
                        $('#warn').text("Tên đăng nhập đã tồn tại. Vui lòng chọn tên khác")
                    }

                },

            });
        }
    }

    function checkLogin() {
        $.ajax({
            url: '${ctxPath}/user/check-login',
            type: "GET",
            contentType: "application/json",
            dataType: 'json',
            data: {
                username: $('#login-username').val(),
                password: $('#login-password').val()
            },
            success: function (data) {
                if (data.msg == "success") {
                    alert("Đăng nhập thành công");
                    window.location.reload();
                } else {
                    $('#warn').text("Thông tin đăng nhập không chính xác")
                }

            },

        });
    }

    function logOut() {
        var r = confirm("Bạn có chắc chắn muốn đăng xuất");
        if (r == true) {
            $.ajax({
                url: '${ctxPath}/user/logout',
                type: "POST",
                contentType: "application/json",
                dataType: 'json',

                success: function (data) {
                    if (data.msg == "success") {
                        alert("Đăng xuất thành công");
                        window.location.reload();
                    } else {
                        alert("Đăng xuất không thành công");
                    }

                },
                error: function (e) {
                    alert("Error Đăng xuất không thành công");
                },

            });
        }
    }



</script>
<script src="${ctxPath}/resources/client/js/fnReloadAjax.js" type="text/javascript"></script>

<script type="text/javascript">
    function addCartDefault(idProduct) {
        $.ajax({
            url: '${ctxPath}/san-pham/them-gio-hang1',
            type: "GET",
            contentType: "application/json",
            dataType: 'json',
            data: {
                idP: idProduct
            },
            success: function (respronse) {
                alert("Thêm giỏ hàng thành công");
                window.location.reload();
            },
            error: function (e) {
                alert("error " + e.toString());
                window.location.reload();
            }
        });
    }

    function updateCart() {
        var listProduct = $('.txtQuantity');
        var cartList = [];
        var state = 0;
        $.each(listProduct, function (i, item) {
            if ($(item).val() == '0') {
                state = 1;
                return;
            } else {
                cartList.push({
                    quantity: $(item).val(),
                    productId: $(item).data('id')
                });
            }

        });

        if (state == 0) {
            $.ajax({
                url: '${ctxPath}/san-pham/cap-nhat',
                type: "GET",
                contentType: "application/json",
                dataType: 'json',
                data: {
                    cartModel: JSON.stringify(cartList)
                },
                success: function (res) {
                    if (res.msg == "success") {
                        var table = $('#dataTables-example1').dataTable();
                        // Example call to reload from original file
                        table.fnReloadAjax();
                        new PNotify({
                            title: 'Thành công',
                            text: 'Cập nhật giỏ hàng thành công!',
                            type: 'success',
                            styling: 'bootstrap3'
                        });

                    } else {
                        new PNotify({
                            title: 'Không thành công',
                            text: 'Cập nhật giỏ hàng không thành công!',
                            type: 'Error',
                            styling: 'bootstrap3'
                        });
                    }
                },
                error: function (e) {
                    new PNotify({
                        title: 'Không thành công',
                        text: 'Cập nhật giỏ hàng lỗi!',
                        type: 'Error',
                        styling: 'bootstrap3'
                    });
                }
            });
        } else {
            new PNotify({
                title: 'Không thành công',
                text: 'Cập nhật giỏ hàng lỗi! Không thể cho số lượng 0',
                type: 'Error',
                styling: 'bootstrap3'
            });
        }
    }
</script>


<!-- PNotify -->
<script src="${ctxPath}/resources/admin/static/vendors/pnotify/dist/pnotify.js"></script>
<script src="${ctxPath}/resources/admin/static/vendors/pnotify/dist/pnotify.buttons.js"></script>
<script src="${ctxPath}/resources/admin/static/vendors/pnotify/dist/pnotify.nonblock.js"></script>
<!-- NProgress -->
<script src="${ctxPath}/resources/admin/static/vendors/nprogress/nprogress.js"></script>
</body>
</html>