<!-- begin #sidebar -->
<div id="sidebar" class="sidebar">
    <!-- begin sidebar scrollbar -->
    <div data-scrollbar="true" data-height="100%">
        <!-- begin sidebar user -->
        <ul class="nav">
            <li class="nav-profile">
                <a href="javascript:;" data-toggle="nav-profile">
                    <div class="cover with-shadow"></div>
                    <div class="image">
                        <img src="{$myf_path}/statics/admin/img/user/user-13.jpg" alt="" />
                    </div>
                    <div class="info">
                        <b class="caret pull-right"></b>
                        admin
                        <small>系统管理员</small>
                    </div>
                </a>
            </li>
            <li>
                <ul class="nav nav-profile">
                    <li><a href="javascript:;" data-click="theme-panel-expand"><i class="fa fa-cog"></i> 样式</a></li>
                    <li class="has-sub">
                        <a href="javascript:;">
                            <b class="caret pull-right"></b>
                            <i class="fa fa-question-circle"></i>
                            <span>帮助</span>
                        </a>
                        <ul class="sub-menu">
                            <li><a href="table_manage.html">参考文档</a></li>
                            <li><a href="table_manage_autofill.html">意见建议反馈</a></li>
                            <li><a href="table_manage_rowreorder.html">官方交流论坛</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
        <!-- end sidebar user -->
        <!-- begin sidebar nav -->
        <ul class="nav">
            <li class="nav-header">导航</li>
            <li>
                <a id="sidebar-menu-0" href="#!home">
                    <i class="fa fa-home"></i>
                    <span>主页</span>
                </a>
            </li>
            {foreach from=$menuTree item=menu}
            <li {if !empty($menu.children)}class="has-sub"{/if} >
                <a {if !empty($menu.children)}href="javascript:;"{else}href="#!{$menu.url}"{/if}  id="sidebar-menu-{$menu.id}">
                    <b class="caret"></b>
                    {if !empty($menu.icon)}
                    <i class="{$menu.icon|escape:'html'}"></i>
                    {/if}
                    <span>{$menu.name|escape:'html'}</span>
                </a>
                {if !empty($menu.children)}
                <ul class="sub-menu">
                    {foreach from=$menu.children item=menu2}
                    <li>
                        <a id="sidebar-menu-{$menu2.id}" {if !empty($menu2.children)}href="javascript:;"{else}href="#!{$menu2.url}"{/if} >{$menu2.name}</a>
                        {if !empty($menu2.children)}
                        <ul class="sub-menu">
                            {foreach from=$menu2.children item=menu3}
                            <li>
                                <a id="sidebar-menu-{$menu3.id}" href="#!{$menu3.url}" >{$menu3.name|escape:'html'}</a>
                            </li>
                            {/foreach}
                        </ul>
                        {/if}
                    </li>
                    {/foreach}
                </ul>
                {/if}
            </li>
            {/foreach}
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret pull-right"></b>
                    <i class="fa fa-question-circle"></i>
                    <span>帮助</span>
                </a>
                <ul class="sub-menu">
                    <li><a href="table_manage.html">参考文档</a></li>
                    <li><a href="table_manage_autofill.html">意见建议反馈</a></li>
                    <li><a href="table_manage_rowreorder.html">官方交流论坛</a></li>
                </ul>
            </li>

            <!-- begin sidebar minify button -->
            <li><a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify"><i class="fa fa-angle-double-left"></i></a></li>
            <!-- end sidebar minify button -->
        </ul>
        <!-- end sidebar nav -->
    </div>
    <!-- end sidebar scrollbar -->
</div>
<div class="sidebar-bg"></div>
<!-- end #sidebar -->
<textarea id="sidebar-json-data" style="display: none">{$menuJson}</textarea>