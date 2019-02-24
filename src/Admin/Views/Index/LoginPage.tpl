<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <title>管理后台登录|FreeCMS</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />

    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
    <link href="<{$myf_path}>/statics/admin/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="<{$myf_path}>/statics/admin/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<{$myf_path}>/statics/admin/plugins/font-awesome/css/fontawesome-all.min.css" rel="stylesheet" />
    <link href="<{$myf_path}>/statics/admin/plugins/animate/animate.min.css" rel="stylesheet" />
    <link href="<{$myf_path}>/statics/admin/css/default/style.min.css" rel="stylesheet" />
    <link href="<{$myf_path}>/statics/admin/css/default/style-responsive.min.css" rel="stylesheet" />
    <link href="<{$myf_path}>/statics/admin/css/default/theme/default.css" rel="stylesheet" id="theme" />
    <!-- ================== END BASE CSS STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="<{$myf_path}>/statics/admin/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<body class="pace-top bg-white">
<!-- begin #page-loader -->
<div id="page-loader" class="fade show"><span class="spinner"></span></div>
<!-- end #page-loader -->

<!-- begin #page-container -->
<div id="page-container" class="fade">
    <!-- begin login -->
    <div class="login login-with-news-feed">
        <!-- begin news-feed -->
        <div class="news-feed">
            <div class="news-image" style="background-image: url(<{$myf_path}>/statics/admin/img/login-bg/login-bg-11.jpg)"></div>
            <div class="news-caption">
                <h4 class="caption-title"><b>FreeCMS</b> 内容管理系统</h4>
                <p>
                    FreeCMS完全开源免费的PHP内容管理系统 当前版本：v1.0.0
                </p>
            </div>
        </div>
        <!-- end news-feed -->
        <!-- begin right-content -->
        <div class="right-content">
            <!-- begin login-header -->
            <div class="login-header">
                <div class="brand">
                    <span class="logo"></span> <b>FreeCMS</b>
                    <small>内容管理系统后台登录</small>
                </div>
                <div class="icon">
                    <i class="fa fa-sign-in"></i>
                </div>
            </div>
            <!-- end login-header -->
            <!-- begin login-content -->
            <div class="login-content">
                <form action="index.html" method="GET" class="margin-bottom-0">
                    <div class="form-group m-b-15">
                        <input type="text" class="form-control form-control-lg" placeholder="用户名" required />
                    </div>
                    <div class="form-group m-b-15">
                        <input type="password" class="form-control form-control-lg" placeholder="密码" required />
                    </div>
                    <div class="checkbox checkbox-css m-b-30">
                        <input type="checkbox" id="remember_me_checkbox" value="" />
                        <label for="remember_me_checkbox">
                            记住登录信息
                        </label>
                    </div>
                    <div class="login-buttons">
                        <button type="submit" class="btn btn-success btn-block btn-lg">登录</button>
                    </div>
                    <div class="m-t-20 m-b-40 p-b-40 text-inverse">
                        忘记密码?  <a href="register_v3.html" class="text-success">找回密码教程</a> .
                    </div>
                    <hr />
                    <p class="text-center text-grey-darker">
                        &copy; FreeCMS 版权所有 2019
                    </p>
                </form>
            </div>
            <!-- end login-content -->
        </div>
        <!-- end right-container -->
    </div>
    <!-- end login -->

    <!-- begin theme-panel -->
    <div class="theme-panel theme-panel-lg">
        <a href="javascript:;" data-click="theme-panel-expand" class="theme-collapse-btn"><i class="fa fa-cog"></i></a>
        <div class="theme-panel-content">
            <h5 class="m-t-0">系统样式</h5>
            <ul class="theme-list clearfix">
                <li><a href="javascript:;" class="bg-red" data-theme="red" data-theme-file="<{$myf_path}>/statics/admin/css/default/theme/red.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="红色">&nbsp;</a></li>
                <li><a href="javascript:;" class="bg-pink" data-theme="pink" data-theme-file="<{$myf_path}>/statics/admin/css/default/theme/pink.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="粉色">&nbsp;</a></li>
                <li><a href="javascript:;" class="bg-orange" data-theme="orange" data-theme-file="<{$myf_path}>/statics/admin/css/default/theme/orange.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="橘色">&nbsp;</a></li>
                <li><a href="javascript:;" class="bg-yellow" data-theme="yellow" data-theme-file="<{$myf_path}>/statics/admin/css/default/theme/yellow.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="黄色">&nbsp;</a></li>
                <li><a href="javascript:;" class="bg-lime" data-theme="lime" data-theme-file="<{$myf_path}>/statics/admin/css/default/theme/lime.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="浅绿色">&nbsp;</a></li>
                <li><a href="javascript:;" class="bg-green" data-theme="green" data-theme-file="<{$myf_path}>/statics/admin/css/default/theme/green.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="绿色">&nbsp;</a></li>
                <li><a href="javascript:;" class="bg-teal" data-theme="default" data-theme-file="<{$myf_path}>/statics/admin/css/default/theme/default.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="默认">&nbsp;</a></li>
                <li><a href="javascript:;" class="bg-aqua" data-theme="aqua" data-theme-file="<{$myf_path}>/statics/admin/css/default/theme/aqua.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="水绿色">&nbsp;</a></li>
                <li><a href="javascript:;" class="bg-blue" data-theme="blue" data-theme-file="<{$myf_path}>/statics/admin/css/default/theme/blue.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="蓝色">&nbsp;</a></li>
                <li><a href="javascript:;" class="bg-purple" data-theme="purple" data-theme-file="<{$myf_path}>/statics/admin/css/default/theme/purple.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="紫色">&nbsp;</a></li>
                <li><a href="javascript:;" class="bg-indigo" data-theme="indigo" data-theme-file="<{$myf_path}>/statics/admin/css/default/theme/indigo.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="靛蓝">&nbsp;</a></li>
                <li><a href="javascript:;" class="bg-black" data-theme="black" data-theme-file="<{$myf_path}>/statics/admin/css/default/theme/black.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="黑色">&nbsp;</a></li>
            </ul>
            <div class="divider"></div>
            <div class="row m-t-10">
                <div class="col-md-6 control-label text-inverse f-w-600">顶部样式</div>
                <div class="col-md-6">
                    <select name="header-styling" class="form-control form-control-sm">
                        <option value="1">默认</option>
                        <option value="2">相反</option>
                    </select>
                </div>
            </div>
            <div class="row m-t-10">
                <div class="col-md-6 control-label text-inverse f-w-600">顶部</div>
                <div class="col-md-6">
                    <select name="header-fixed" class="form-control form-control-sm">
                        <option value="1">固定</option>
                        <option value="2">默认</option>
                    </select>
                </div>
            </div>
            <div class="row m-t-10">
                <div class="col-md-6 control-label text-inverse f-w-600">侧边栏样式</div>
                <div class="col-md-6">
                    <select name="sidebar-styling" class="form-control form-control-sm">
                        <option value="1">默认</option>
                        <option value="2">表格</option>
                    </select>
                </div>
            </div>
            <div class="row m-t-10">
                <div class="col-md-6 control-label text-inverse f-w-600">侧边栏</div>
                <div class="col-md-6">
                    <select name="sidebar-fixed" class="form-control form-control-sm">
                        <option value="1">固定</option>
                        <option value="2">默认</option>
                    </select>
                </div>
            </div>
            <div class="row m-t-10">
                <div class="col-md-6 control-label text-inverse f-w-600">边栏渐变</div>
                <div class="col-md-6">
                    <select name="content-gradient" class="form-control form-control-sm">
                        <option value="1">关闭</option>
                        <option value="2">开启</option>
                    </select>
                </div>
            </div>
            <div class="row m-t-10">
                <div class="col-md-6 control-label text-inverse f-w-600">内容样式</div>
                <div class="col-md-6">
                    <select name="content-styling" class="form-control form-control-sm">
                        <option value="1">默认</option>
                        <option value="2">黑色</option>
                    </select>
                </div>
            </div>
            <div class="divider"></div>
            <div class="row m-t-10">
                <div class="col-md-12">
                    <a href="javascript:;" class="btn btn-inverse btn-block btn-rounded" data-click="reset-local-storage"><b>Reset Local Storage</b></a>
                </div>
            </div>
        </div>
    </div>
    <!-- end theme-panel -->
</div>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<script src="<{$myf_path}>/statics/admin/plugins/jquery/jquery-3.2.1.min.js"></script>
<script src="<{$myf_path}>/statics/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="<{$myf_path}>/statics/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!--[if lt IE 9]>
<script src="<{$myf_path}>/statics/admin/crossbrowserjs/html5shiv.js"></script>
<script src="<{$myf_path}>/statics/admin/crossbrowserjs/respond.min.js"></script>
<script src="<{$myf_path}>/statics/admin/crossbrowserjs/excanvas.min.js"></script>
<![endif]-->
<script src="<{$myf_path}>/statics/admin/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="<{$myf_path}>/statics/admin/plugins/js-cookie/js.cookie.js"></script>
<script src="<{$myf_path}>/statics/admin/js/theme/default.min.js"></script>
<script src="<{$myf_path}>/statics/admin/js/apps.min.js"></script>
<!-- ================== END BASE JS ================== -->

<script>
    $(document).ready(function() {
        App.init();
    });
</script>
</body>
</html>
