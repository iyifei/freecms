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
                        <img src="<{$myf_path}>/statics/admin/img/user/user-13.jpg" alt="" />
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
                <a id="sidebarHomeMenu" data-url="<{$myf_path}>/admin/home" class="sidebar-menu" href="javascript:loadPage('sidebarHomeMenu');">
                    <i class="fa fa-home"></i>
                    <span>主页</span>
                </a>
            </li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-gem"></i>
                    <span>核心</span>
                </a>
                <ul class="sub-menu">
                    <li><a id="sidebarContentMenu" data-url="<{$myf_path}>/admin/content" class="sidebar-menu" href="javascript:loadPage('sidebarContentMenu');">内容管理</a></li>
                </ul>
            </li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-cubes"></i>
                    <span>模块</span>
                </a>
                <ul class="sub-menu">
                    <li class="has-sub">
                        <a href="javascript:;"><b class="caret pull-right"></b> 模块管理</a>
                        <ul class="sub-menu">
                            <li><a href="table_manage.html">模块管理</a></li>
                            <li><a href="table_manage_autofill.html">上传模块</a></li>
                            <li><a href="table_manage_buttons.html">模块生成向导</a></li>
                        </ul>
                    </li>
                    <li class="has-sub">
                        <a href="javascript:;"><b class="caret pull-right"></b> 辅助插件</a>
                        <ul class="sub-menu">
                            <li><a href="table_manage.html">插件管理器</a></li>
                            <li><a href="table_manage_autofill.html">文件管理器</a></li>
                            <li><a href="table_manage_buttons.html">广告管理</a></li>
                            <li><a href="table_manage_buttons.html">友情链接</a></li>
                            <li><a href="table_manage_buttons.html">投票模块</a></li>
                        </ul>
                    </li>
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
                    <li class="has-sub">
                        <a href="javascript:;"><b class="caret pull-right"></b> 采集管理</a>
                        <ul class="sub-menu">
                            <li><a href="table_manage.html">采集节点管理</a></li>
                            <li><a href="table_manage_autofill.html">临时内容管理</a></li>
                            <li><a href="table_manage_rowreorder.html">导入采集规则</a></li>
                            <li><a href="table_manage_combine.html">监控采集模式</a></li>
                            <li><a href="table_manage_select.html">采集未下载的内容</a></li>
                        </ul>
                    </li>
                    <li class="has-sub">
                        <a href="javascript:;"><b class="caret pull-right"></b> 批量维护</a>
                        <ul class="sub-menu">
                            <li><a href="table_manage.html">更新系统缓存</a></li>
                            <li><a href="table_manage_autofill.html">搜索关键字维护</a></li>
                            <li><a href="table_manage_rowreorder.html">文档关键字维护</a></li>
                            <li><a href="table_manage_combine.html">重复文档检测</a></li>
                            <li><a href="table_manage_select.html">自动摘要|分页</a></li>
                            <li><a href="table_manage_select.html">TAG标签管理</a></li>
                        </ul>
                    </li>
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
                    <li><a href="chart-flot.html">默认模板管理</a></li>
                    <li><a href="chart-morris.html">标签源码管理</a></li>
                    <li class="has-sub">
                        <a href="javascript:;"><b class="caret pull-right"></b> 系统帮助</a>
                        <ul class="sub-menu">
                            <li><a href="table_manage.html">参考文档</a></li>
                            <li><a href="table_manage_autofill.html">意见建议反馈</a></li>
                            <li><a href="table_manage_rowreorder.html">官方交流论坛</a></li>
                        </ul>
                    </li>
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
                    <li><a href="gallery_v2.html">系统用户管理</a></li>
                    <li><a href="gallery_v2.html">用户组设置</a></li>
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