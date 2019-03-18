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
                        <img src="{$CurrentMember.avatarThumbUrl}" alt="" />
                    </div>
                    <div class="info">
                        <b class="caret pull-right"></b>
                        {$CurrentMember.userid}
                        <small>{$CurrentMember.uname}</small>
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
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret pull-right"></b>
                    <i class="fas fa-comments"></i>
                    <span>帖子管理</span>
                </a>
                <ul class="sub-menu">
                    <li><a target="_blank" href="{$myf_path}/forum/user/subject/{$CurrentMember.menid}.html">我的主贴</a></li>
                    <li><a id="sidebar-menu-3" href="{$myf_path}/forum/user/posts/{$CurrentMember.menid}.html">我的回帖</a></li>
                </ul>
            </li>
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