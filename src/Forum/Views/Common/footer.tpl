
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
                    <h4>关于FreeCMS论坛</h4>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultrices ipsum in elementum porttitor.
                        Cras porttitor fermentum nisl non elementum. Nulla in placerat libero. Nulla pharetra purus eget diam dictum
                        ullamcorper nec et eros. Suspendisse consectetur nulla ut volutpat aliquam.
                    </p>
                </div>
                <!-- end section-container -->
            </div>
            <!-- end col-4 -->
            <!-- begin col-4 -->
            <div class="col-md-4">
                <!-- begin section-container -->
                <div class="section-container">
                    <h4>Latest Post</h4>
                    <ul class="latest-post">
                        <li>
                            <h4 class="title"><a href="#">Consectetur adipiscing elit ultrices</a></h4>
                            <p class="time">yesterday 10:42am</p>
                        </li>
                        <li>
                            <h4 class="title"><a href="#">Fusce ultrices ipsum porttitor</a></h4>
                            <p class="time">10/04/2015</p>
                        </li>
                        <li>
                            <h4 class="title"><a href="#">Cras porttitor fermentum adipiscing</a></h4>
                            <p class="time">02/04/2015</p>
                        </li>
                    </ul>
                </div>
                <!-- end section-container -->
            </div>
            <!-- end col-4 -->
            <!-- begin col-4 -->
            <div class="col-md-4">
                <!-- begin section-container -->
                <div class="section-container">
                    <h4>New Users</h4>
                    <ul class="new-user">
                        <li><a href="#"><img src="{$myf_path}/statics/public/img/user/user-1.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{$myf_path}/statics/public/img/user/user-2.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{$myf_path}/statics/public/img/user/user-3.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{$myf_path}/statics/public/img/user/user-4.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{$myf_path}/statics/public/img/user/user-5.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{$myf_path}/statics/public/img/user/user-6.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{$myf_path}/statics/public/img/user/user-7.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{$myf_path}/statics/public/img/user/user-8.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{$myf_path}/statics/public/img/user/user-9.jpg" alt="" /></a></li>
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