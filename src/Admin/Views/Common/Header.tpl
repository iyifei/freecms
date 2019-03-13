<!-- begin #header -->
<div id="header" class="header navbar-default">
    <!-- begin navbar-header -->
    <div class="navbar-header">
        <a href="{$myf_path}/admin#!home" class="navbar-brand"><span class="navbar-logo"></span> <b>FreeCMS</b>内容管理系统</a>
        <button type="button" class="navbar-toggle" data-click="sidebar-toggled">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
    </div>
    <!-- end navbar-header -->

    <!-- begin header-nav -->
    <ul class="navbar-nav navbar-right m-r-20">
        <li class="dropdown navbar-user">
            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
                <img src="{$myf_path}/cloud/{if !empty($admin.avatar)}{$admin.avatar}{else}images/default_avatar.png{/if}?thumbnail=h-90/w-90">
                <span class="d-none d-md-inline">{$admin.uname|default:$admin.userid}</span> <b class="caret"></b>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item"
                   data-href="{$myf_path}/admin/system/admin/edit?method=update&id={$admin.id}"
                   href="javascript:openModel('btnEdit_Profile_{$admin.id}')"
                   data-title="个人设置"
                   id="btnEdit_Profile_{$admin.id}"
                >个人设置</a>
                <a href="javascript:;" data-click="theme-panel-expand" class="dropdown-item">系统样式</a>
                <div class="dropdown-divider"></div>
                <a href="{$myf_path}/admin/quit" class="dropdown-item">退出</a>
            </div>
        </li>
    </ul>
    <!-- end header navigation right -->
</div>
<!-- end #header -->