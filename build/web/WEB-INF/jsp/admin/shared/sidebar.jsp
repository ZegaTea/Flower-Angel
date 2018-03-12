<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  language="java"%>

<!-- sidebar menu -->
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
  <div class="menu_section">
    <h3>General</h3>
    <ul class="nav side-menu">
      <li><a><i class="fa fa-bar-chart-o"></i> Quản lý <span
          class="fa fa-chevron-down"></span></a>
        <ul class="nav child_menu">
          <li><a href="${ctxPath}/admin/san-pham/">Quản lý sản phầm</a></li>
          <li><a href="${ctxPath}/admin/danh-muc/">Quản lý danh mục</a></li>
          <li><a href="${ctxPath}/admin/don-hang/">Quản lý đơn hàng</a></li>
          <li><a href="${ctxPath}/admin/nguoi-dung/">Quản lý người dùng</a></li>
          <li><a href="${ctxPath}/admin/trang-thai/">Quản lý trạng thái</a></li>
        </ul></li>
    </ul>
  </div>
</div>
<!-- /sidebar menu -->

<!-- /menu footer buttons -->
<div class="sidebar-footer hidden-small">
  <a data-toggle="tooltip" data-placement="top" title="Logout"
    href="${ctxPath}/admin/login/logout"> <span class="glyphicon glyphicon-off"
    aria-hidden="true"></span>
  </a>
</div>
<!-- /menu footer buttons -->
</div>
</div>

<!-- top navigation -->
<div class="top_nav">
  <div class="nav_menu">
    <nav>
      <div class="nav toggle">
        <a id="menu_toggle"><i class="fa fa-bars"></i></a>
      </div>
      <ul class="nav navbar-nav navbar-right">
        <li class="">
          <a href="javascript:;" class="user-profile dropdown-toggle"
          data-toggle="dropdown" aria-expanded="false"> 
            <img src="/data/${avartar}" alt="">${fullName}
            <span class=" fa fa-angle-down"></span>
          </a>
          <ul class="dropdown-menu dropdown-usermenu pull-right">           
            <li><a href="${ctxPath}/adminInfo"> Thông tin </a></li>
            <li>
              <a href="${ctxPath}/admin/login/logout">
                <i class="fa fa-sign-out pull-right"></i> Đăng xuất 
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
  </div>
</div>
<!-- /top navigation -->