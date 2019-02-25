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

<div class="modal fade" id="myModal"  tabindex="-1" style="display: none">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Modal Dialog</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body p-l-30 p-r-30">
                <iframe id="modelIframe" type="text/html" width="100%" height="460" src="" frameborder="0" allowfullscreen=""></iframe>
            </div>
            <div class="modal-footer">
                <a href="javascript:;" class="btn btn-white" data-dismiss="modal">关闭</a>
                <a href="javascript:doModalSubmit();" class="btn btn-success">保存</a>
            </div>
        </div>
    </div>
</div>

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

    //加载页面
    function loadPage(hash,menuId) {
        var url = "<{$myf_path}>/admin/"+hash;
        console.log('loadUrl:'+url);
        $("#content").load(url);
        $("#sidebar .nav li").removeClass('active');
        $('#sidebar-menu-'+menuId).parents('li').addClass('active');
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

    //打开弹出框
    var modelState = false;
    function openModel(id) {
        modelState = true;
        var src = $("#"+id).attr('data-href');
        var title = $("#"+id).data("title");
        $('#myModal .modal-title').html(title);
        $('#myModal').modal('show').on('hidden.bs.modal',function () {
            modelState = false;
        });
        $('#myModal iframe').attr('src', src);
    }

    //提交数据
    function doModalSubmit() {
        var subWin = window.frames['modelIframe'].contentWindow;
        if(typeof(subWin.submitForm)==='function'){
            subWin.submitForm();
        }
    }

    //操作成功回调
    function successCallback() {
        FreeCms.success('操作执行成功');
        if(modelState){
            modelState = false;
            $('#myModal').modal('hide').on('hidden.bs.modal', function (e) {
                reloadThisPage();
            })
        }else{
            reloadThisPage();
        }
    }

    //刷新页面
    function reloadThisPage() {
        setTimeout(function () {
            var hash = window.location.hash;
            hash = hash.split('?')[0];
            window.location.hash=hash+'?'+Date.parse(new Date());
        },500);
    }
</script>
</body>
</html>
