<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="../init.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Đăng nhập</title>
	 <!-- jQuery -->
    <script src="${ctxPath}/resources/admin/static/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <link href="${ctxPath}/resources/admin/static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${ctxPath}/resources/admin/static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${ctxPath}/resources/admin/static/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="${ctxPath}/resources/admin/static/vendors/animate.css/animate.min.css" rel="stylesheet">
<!-- PNotify -->
    <link href="${ctxPath}/resources/admin/static/vendors/pnotify/dist/pnotify.css" rel="stylesheet">
    <link href="${ctxPath}/resources/admin/static/vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
    <link href="${ctxPath}/resources/admin/static/vendors/pnotify/dist/pnotify.nonblock.css" rel="stylesheet">
    <!-- PNotify -->
    <script src="${ctxPath}/resources/admin/static/vendors/pnotify/dist/pnotify.js"></script>
    <script src="${ctxPath}/resources/admin/static/vendors/pnotify/dist/pnotify.buttons.js"></script>
    <script src="${ctxPath}/resources/admin/static/vendors/pnotify/dist/pnotify.nonblock.js"></script>
    <!-- Custom Theme Style -->
    <link href="${ctxPath}/resources/admin/static/build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form method="POST" action="${ctxPath}/admin/login/check-login">
              <h1>Đăng nhập</h1>
              <div>
                <input type="text" name="name" class="form-control" placeholder="Tên tài khoản" required="" />
              </div>
              <div>
                <input type="password" name="pass" class="form-control" placeholder="Mật khẩu" required="" />
              </div>
              <div>
                <input class="btn btn-default submit" type="submit" value="Đăng nhập">
                <a class="reset_pass" href="${ctxPath}/pass">Đổi mật khẩu</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> Flower Angel!</h1>
                  <p>©2017 All Rights Reserved. Flower Angel Co., Ltd.</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
    <%try{%>
<c:if test="<%=session.getAttribute(Constants.LOGIN_FAIL).toString().equals(Constants.LOGIN_FAIL) %>">
	<script>
		$(document).ready(function(){
			new PNotify({
                title: 'Thất bại!',
                text: 'Sai tên tài khoản hoặc mật khẩu.',
                type: 'error',
                styling: 'bootstrap3'
            });
		});		
	</script>
	<%session.removeAttribute(Constants.LOGIN_FAIL); %>
</c:if>
<%}catch(Exception e){}%>
  </body>
</html>
