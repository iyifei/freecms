<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    {include file='../Common/Head.tpl'}
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
            <div class="news-image" style="background-image: url({$myf_path}/statics/admin/img/login-bg/login-bg-11.jpg)"></div>
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
                <form autocomplete="off" class="margin-bottom-0">
                    <div class="form-group m-b-15">
                        <input name="userid" type="text" class="form-control form-control-lg" placeholder="用户名" required />
                    </div>
                    <div class="form-group m-b-15">
                        <input name="pwd" type="password" class="form-control form-control-lg" placeholder="密码" required />
                    </div>
                    <div class="form-group m-b-15">
                        <div class="row">
                            <div class="col-6 col-sm-6">
                                <input id="vdcode" name="vcode" type="text" maxlength="4" class="form-control form-control-lg" placeholder="验证码" required />
                            </div>
                            <div class="col-6 col-sm-6">
                                <img id="vdimgck" onclick="changeAuthCode()" style="cursor: pointer;border:1px solid #d3d8de" alt="验证码"
                                     title="看不清？点击更换" src="{$myf_path}/captcha?w=120&h=40&s=25" align="absmiddle">
                            </div>
                        </div>
                    </div>
                    <div class="checkbox checkbox-css m-b-30">
                        <input type="checkbox" id="remember_me_checkbox" value="" />
                        <label for="remember_me_checkbox">
                            记住登录信息
                        </label>
                    </div>
                    <div class="login-buttons">
                        <button type="button" id="btnSubmit" onclick="FreeCms.doEditSubmit();" class="btn btn-success btn-block btn-lg">登录</button>
                    </div>
                    <div class="m-t-20 m-b-40 p-b-40 text-inverse">
                        忘记密码?  <a href="http://www.freecms.com.cn/" class="text-success">找回密码教程</a> .
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

    {include file="../Common/Theme.tpl"}
</div>
<!-- end page container -->

{include file="../Common/BaseJs.tpl"}
<input type="hidden" id="submitUrl" value="{$myf_path}/admin/login">
<script>
    $(document).ready(function() {
        App.init();
        
        $(".form-control").keyup(function (event) {
            if(event.keyCode ==13){
                $("#btnSubmit").trigger("click");
            }
        })
    });

    function callbackSaveSuccess() {
        window.location.href='{$myf_path}/admin';
    }

    function changeAuthCode() {
        var picsrc = $("#vdimgck").attr("src");
        $("#vdimgck").attr("src", picsrc);
        $("#vdcode").val('');
    }
</script>
</body>
</html>
