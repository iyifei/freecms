<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <{include file="../Common/Head.tpl"}>
</head>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade show"><span class="spinner"></span></div>
<!-- end #page-loader -->

<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">

    <{include file="../Common/Header.tpl"}>

    <{include file="../Common/Sidebar.tpl"}>

    <!-- begin #content -->
    <div id="content" class="content">

    </div>
    <!-- end #content -->

    <{include file="../Common/Theme.tpl"}>

    <{include file="../Common/Footer.tpl"}>
</div>
<!-- end page container -->
<{include file="../Common/BaseJs.tpl"}>


<script>
    $(document).ready(function() {
        App.init();
        loadHomePage();
    });

    //加载后台主页
    function loadHomePage() {
        if(window.location.hash==''){
            window.location.hash = '#!home';
        }
    }

    var handleDashboardGritterNotification = function() {
        setTimeout(function() {
            $.gritter.add({
                title: 'Welcome back, Admin!',
                text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempus lacus ut lectus rutrum placerat.',
                image: '<{$myf_path}>/statics/admin/img/user/user-12.jpg',
                sticky: true,
                time: '',
                class_name: 'my-sticky-class'
            });
        }, 1000);
    };

    //加载页面
    function loadPage(hash,menuId) {
        var url = "<{$myf_path}>/admin/"+hash;
        console.log('loadUrl:'+url);
        $("#content").load(url);
        $("#sidebar .nav li").removeClass('active');
        $('#sidebar-menu-'+menuId).parents('li').addClass('active');
    }

    //加载未知页面
    function loadNuknownPage(hash) {
        var url = "<{$myf_path}>/admin/"+hash;
        console.log('load Unknown Url:'+url);
        $("#content").load(url);
    }

    //网站路由
    var freeCmsRouter;
    $(document).ready(function () {
        var menus = eval('(' + $("#sidebar-json-data").val() + ')');
        freeCmsRouter = new Router();
        freeCmsRouter.add('home', '0',function(hash,id) {
            loadPage(hash,id);
        });
        for(var i=0;i<menus.length;i++){
            var menu = menus[i];
            freeCmsRouter.add(menu['url'], menu['id'],function(hash,id) {
                loadPage(hash,id);
            });
        }
        freeCmsRouter.start();
    })
</script>
</body>
</html>
