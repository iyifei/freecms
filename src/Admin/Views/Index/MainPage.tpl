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
        //loadHomePage();
    });

    //加载后台主页
    function loadHomePage() {
        loadPage('sidebarHomeMenu');
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

    function loadPage(id,menuId) {
        if(menuId==undefined){
            menuId = id;
        }
        var url = $('#'+id).data('url');
        console.log('loadUrl:'+url);
        $("#content").load(url);
        $("#sidebar .nav li").removeClass('active');
        $('#'+menuId).parents('li').addClass('active');
    }

    var router;
    $(document).ready(function () {
        router = new Router();
        router.add('home', function(info) {
            console.log(info);
            loadPage('sidebarHomeMenu');
        });
        router.add('content', function() {
            loadPage('sidebarContentMenu');
        });
        router.add('system/menu', function() {
            loadPage('sidebarSystemMenu');
        });
        router.start();
    })
</script>
</body>
</html>
