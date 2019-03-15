
<!-- begin #footer -->
<div id="footer" class="footer">
    <!-- begin container -->
    <div class="container">
        <!-- begin row -->
        <div class="row">
            <!-- begin col-4 -->
            <div class="col-md-4">
                <!-- begin section-container -->
                <div class="section-container">
                    <h4>关于{$forum.title}</h4>
                    <p>
                      {$forum.description}
                    </p>
                </div>
                <!-- end section-container -->
            </div>
            <!-- end col-4 -->
            <!-- begin col-4 -->
            <div class="col-md-4">
                <!-- begin section-container -->
                <div class="section-container">
                    <h4>最新回帖</h4>
                    <ul class="latest-post">
                        {subject id="arc" limit="3"}
                        <li>
                            <h4 class="title"><a href="{$arc.linkurl}">{$arc.title}</a></h4>
                            <p class="time">{$arc.lastTime}</p>
                        </li>
                        {/subject}
                    </ul>
                </div>
                <!-- end section-container -->
            </div>
            <!-- end col-4 -->
            <!-- begin col-4 -->
            <div class="col-md-4">
                <!-- begin section-container -->
                <div class="section-container">
                    <h4>新注册会员</h4>
                    <ul class="new-user">
                        {member id="mem" limit="9"}
                        <li><a href="{$mem.profileurl}"><img src="{$mem.avatarThumbUrl}" alt="" /></a></li>
                        {/member}
                    </ul>
                </div>
                <!-- end section-container -->
            </div>
            <!-- end col-4 -->
        </div>
        <!-- end row -->
    </div>
    <!-- end container -->
</div>
<!-- end #footer -->
<!-- begin #footer-copyright -->
<div id="footer-copyright" class="footer-copyright">
    <div class="container">
        &copy; 2014 - 2017 FreeCMS.com.cn All Right Reserved
        <a href="#">Contact Us</a>
        <a href="#">Knowledge Base</a>
    </div>
</div>
<!-- end #footer-copyright -->
<!-- begin theme-panel -->
<div class="theme-panel">
    <a href="javascript:;" data-click="theme-panel-expand" class="theme-collapse-btn"><i class="fa fa-cog"></i></a>
    <div class="theme-panel-content">
        <ul class="theme-list clearfix">
            <li><a href="javascript:;" class="bg-purple" data-theme="purple" data-theme-file="{$myf_path}/statics/public/css/forum/theme/purple.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Purple">&nbsp;</a></li>
            <li><a href="javascript:;" class="bg-blue" data-theme="blue" data-theme-file="{$myf_path}/statics/public/css/forum/theme/blue.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Blue">&nbsp;</a></li>
            <li class="active"><a href="javascript:;" class="bg-green" data-theme-file="{$myf_path}/statics/public/css/forum/theme/default.css" data-theme="default" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Default">&nbsp;</a></li>
            <li><a href="javascript:;" class="bg-orange" data-theme="orange" data-theme-file="{$myf_path}/statics/public/css/forum/theme/orange.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Orange">&nbsp;</a></li>
            <li><a href="javascript:;" class="bg-red" data-theme="red" data-theme-file="{$myf_path}/statics/public/css/forum/theme/red.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Red">&nbsp;</a></li>
        </ul>
    </div>
</div>
<!-- end theme-panel -->

<!-- ================== BEGIN BASE JS ================== -->
<script src="{$myf_path}/statics/public/plugins/jquery/jquery-3.2.1.min.js"></script>
<script src="{$myf_path}/statics/public/plugins/bootstrap3/js/bootstrap.min.js"></script>
<script src="{$myf_path}/statics/public/plugins/jquery-toast/jquery.toast.min.js"></script>
<!--[if lt IE 9]>
<script src="{$myf_path}/statics/public/crossbrowserjs/html5shiv.js"></script>
<script src="{$myf_path}/statics/public/crossbrowserjs/respond.min.js"></script>
<script src="{$myf_path}/statics/public/crossbrowserjs/excanvas.min.js"></script>
<![endif]-->
<script src="{$myf_path}/statics/public/plugins/js-cookie/js.cookie.js"></script>
<script src="{$myf_path}/statics/public/js/forum/apps.min.js"></script>
<script src="{$myf_path}/statics/public/js/freecms.js"></script>
<!-- ================== END BASE JS ================== -->

<script>
    $(document).ready(function() {
        App.init();
    });
</script>