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
                <a id="sidebarHomeMenu" data-url="{$myf_path}/admin/home" class="sidebar-menu" href="#!home">
                    <i class="fa fa-home"></i>
                    <span>主页</span>
                </a>
            </li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-gem"></i>
                    <span>内容</span>
                </a>
                <ul class="sub-menu">
                    <li><a id="sidebarContentMenu" data-url="{$myf_path}/admin/content" class="sidebar-menu" href="#!content">文章管理</a></li>
                    <li><a id="sidebarPictureMenu" data-url="{$myf_path}/admin/content" class="sidebar-menu" href="javascript:loadPage('sidebarPictureMenu');">图集管理</a></li>
                    <li><a id="sidebarVideoMenu" data-url="{$myf_path}/admin/content" class="sidebar-menu" href="javascript:loadPage('sidebarVideoMenu');">视频管理</a></li>
                    <li><a id="sidebarAudioMenu" data-url="{$myf_path}/admin/content" class="sidebar-menu" href="javascript:loadPage('sidebarAudioMenu');">音频管理</a></li>
                </ul>
            </li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-cube"></i>
                    <span>站点</span>
                </a>
                <ul class="sub-menu">
                    <li><a id="sidebarSiteArcType" data-url="{$myf_path}/admin/site/arctype" class="sidebar-menu" href="javascript:loadPage('sidebarSiteArcType');">栏目管理</a></li>
                    <li><a href="table_manage_autofill.html">单页管理</a></li>
                    <li><a href="table_manage_autofill.html">评论管理</a></li>
                    <li><a href="table_manage_autofill.html">友情链接</a></li>
                    <li><a href="table_manage_autofill.html">广告管理</a></li>
                </ul>
            </li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-bus"></i>
                    <span>插件</span>
                </a>
                <ul class="sub-menu">
                    <li><a href="table_manage.html">插件管理器</a></li>
                    <li><a href="table_manage_autofill.html">文件管理器</a></li>
                    <li><a href="table_manage_buttons.html">投票模块</a></li>
                </ul>
            </li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fab fa-html5"></i>
                    <span>生成</span>
                </a>
                <ul class="sub-menu">
                    <li><a href="table_basic.html">一键更新网站</a></li>
                    <li><a href="table_basic.html">更新系统缓存</a></li>
                    <li class="has-sub">
                        <a href="javascript:;"><b class="caret pull-right"></b> HTML更新</a>
                        <ul class="sub-menu">
                            <li><a href="table_manage.html">更新主页HTML</a></li>
                            <li><a href="table_manage_autofill.html">更新栏目HTML</a></li>
                            <li><a href="table_manage_rowreorder.html">更新文档HTML</a></li>
                            <li><a href="table_manage_select.html">更新网站地图</a></li>
                            <li><a href="table_manage_combine.html">更新RSS文件</a></li>
                            <li><a href="table_manage_combine.html">更新专题HTML</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-bus"></i>
                    <span>采集</span>
                </a>
                <ul class="sub-menu">
                    <li><a href="table_manage.html">采集节点管理</a></li>
                    <li><a href="table_manage_autofill.html">临时内容管理</a></li>
                    <li><a href="table_manage_rowreorder.html">导入采集规则</a></li>
                    <li><a href="table_manage_combine.html">监控采集模式</a></li>
                    <li><a href="table_manage_select.html">采集未下载的内容</a></li>
                </ul>
            </li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-database"></i>
                    <span>维护</span>
                </a>
                <ul class="sub-menu">
                    <li><a href="table_manage.html">更新系统缓存</a></li>
                    <li><a href="table_manage_autofill.html">搜索关键字维护</a></li>
                    <li><a href="table_manage_rowreorder.html">文档关键字维护</a></li>
                    <li><a href="table_manage_combine.html">重复文档检测</a></li>
                    <li><a href="table_manage_select.html">自动摘要|分页</a></li>
                    <li><a href="table_manage_select.html">TAG标签管理</a></li>
                </ul>
            </li>

            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-user"></i>
                    <span>会员</span>
                </a>
                <ul class="sub-menu">
                    <li><a href="email_system.html">注册会员列表</a></li>
                    <li><a href="email_newsletter.html">会员等级设置</a></li>
                    <li><a href="email_newsletter.html">积分头衔设置</a></li>
                    <li><a href="email_newsletter.html">会员模型设置</a></li>
                    <li><a href="email_newsletter.html">会员留言管理</a></li>
                    <li><a href="email_newsletter.html">会员动态管理</a></li>
                </ul>
            </li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-medkit"></i>
                    <span>模板</span>
                </a>
                <ul class="sub-menu">
                    <li><a href="chart-flot.html">模板管理</a></li>
                    <li><a href="chart-morris.html">主题管理</a></li>
                    <li><a href="chart-morris.html">导入主题模板</a></li>
                </ul>
            </li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-cogs"></i>
                    <span>系统</span>
                </a>
                <ul class="sub-menu">
                    <li><a href="gallery.html">系统基本参数</a></li>
                    <li><a href="gallery_v2.html">角色管理</a></li>
                    <li><a href="gallery_v2.html">管理员管理</a></li>
                    <li><a id="sidebarSystemMenu" data-url="{$myf_path}/admin/system/menu" class="sidebar-menu" href="#!system/menu">系统菜单管理</a></li>
                    <li><a href="gallery_v2.html">系统菜单</a></li>
                    <li><a href="gallery_v2.html">系统日志管理</a></li>
                    <li><a href="gallery_v2.html">验证安全设置</a></li>
                    <li><a href="gallery_v2.html">图片水印设置</a></li>
                    <li><a href="gallery_v2.html">数据库备份/还原</a></li>

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