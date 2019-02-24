<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <{include file="../Common/Head.tpl"}>
    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->

    <!-- ================== END PAGE LEVEL STYLE ================== -->
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

</script>
</body>
</html>
