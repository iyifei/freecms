<!-- begin #header -->
<div id="header" class="header navbar-default">
    <!-- begin navbar-header -->
    <div class="navbar-header">
        <a href="{$myf_path}/member#!home" class="navbar-brand"><span class="navbar-logo"></span> <b>会员中心</b>&nbsp;FreeCMS</a>
        <button type="button" class="navbar-toggle" data-click="sidebar-toggled">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
    </div>
    <!-- end navbar-header -->

    <!-- begin header-nav -->
    <ul class="navbar-nav navbar-right m-r-20">
        <li>
            <a href="{$myf_path}/" target="_blank">网站首页</a>
        </li>
        <li>
            <a href="{$myf_path}/forum" target="_blank">论坛首页</a>
        </li>
        <li class="dropdown navbar-user">
            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
                <img src="{$CurrentMember.avatarThumbUrl}" alt="" />
                <span class="d-none d-md-inline">{$CurrentMember.userid}</span> <b class="caret"></b>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
                <a href="javascript:;" class="dropdown-item">个人设置</a>
                <div class="dropdown-divider"></div>
                <a href="{$myf_path}/member/quit" class="dropdown-item">退出</a>
            </div>
        </li>
    </ul>
    <!-- end header navigation right -->
</div>
<!-- end #header -->