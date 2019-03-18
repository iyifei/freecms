<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    {include file="../Common/Head.tpl"}
</head>
<body  class="pace-top">
<!-- begin #page-loader -->
<div id="page-loader" class="fade show"><span class="spinner"></span></div>
<!-- end #page-loader -->

<div class="login-cover">
    <div class="login-cover-image" style="background-image: url({$myf_path}/statics/admin/img/login-bg/login-bg-17.jpg)" data-id="login-cover-image"></div>
    <div class="login-cover-bg"></div>
</div>

<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">

    <!-- begin login -->
    <div class="login login-v2" data-pageload-addclass="animated fadeIn">
        <!-- begin brand -->
        <div class="login-header">
            <div class="brand">
                <span class="logo"></span> <b>会员注册</b>
                <small>FreeCMS内容管理系统</small>
            </div>
            <div class="icon">
                <i class="fas fa-user-plus"></i>
            </div>
        </div>
        <!-- end brand -->
        <!-- begin login-content -->
        <div class="login-content">
            <form class="margin-bottom-0" autocomplete="off">
                <div class="form-group m-b-20">
                    <input type="text" name="userid" id="txtUserId" class="form-control form-control-lg" placeholder="登录名,6~20字符" required />
                </div>
                <div class="form-group m-b-20">
                    <input type="text" name="email" id="txtEmail" class="form-control form-control-lg" placeholder="邮箱" required />
                </div>
                <div class="form-group m-b-20">
                    <input type="password" name="pwd" id="txtPwd" class="form-control form-control-lg" placeholder="密码,至少6个字符" required />
                </div>
                <div class="form-group m-b-20">
                    <input type="password" name="repwd" id="txtRePwd" class="form-control form-control-lg" placeholder="密码确认" required />
                </div>
                <div class="form-group m-b-20">
                    <div class="row">
                        <div class="col-6 col-sm-6">
                            <input type="text" name="vcode" id="txtVcode" maxlength="4" class="form-control form-control-lg" placeholder="验证码" required />
                        </div>
                        <div class="col-6 col-sm-6">
                            <img id="vdimgck" onclick="changeAuthCode()" style="cursor: pointer;border:1px solid #d3d8de" alt="验证码"
                                 title="看不清？点击更换" src="{$myf_path}/captcha?w=120&h=40&s=25" align="absmiddle">
                        </div>
                    </div>
                </div>
                <div class="login-buttons">
                    <button type="button" id="btnSubmit" class="btn btn-success btn-block btn-lg">立即注册</button>
                </div>
                <div class="m-t-20">
                    有会员账号? 直接 <a href="javascript:;">登录</a>.返回 <a href="{$myf_path}/">网站</a>,<a href="{$myf_path}/forum">论坛</a>
                </div>
            </form>
        </div>
        <!-- end login-content -->
    </div>
    <!-- end login -->
    <input type="hidden" id="submitUrl" value="{$myf_path}/member/register">
    <input type="hidden" id="goUrl" value="{$go}">

    <ul class="login-bg-list clearfix">
        <li class="active"><a href="javascript:;" data-click="change-bg" data-img="{$myf_path}/statics/admin/img/login-bg/login-bg-17.jpg" style="background-image: url({$myf_path}/statics/admin/img/login-bg/login-bg-17.jpg)"></a></li>
        <li><a href="javascript:;" data-click="change-bg" data-img="{$myf_path}/statics/admin/img/login-bg/login-bg-16.jpg" style="background-image: url({$myf_path}/statics/admin/img/login-bg/login-bg-16.jpg)"></a></li>
        <li><a href="javascript:;" data-click="change-bg" data-img="{$myf_path}/statics/admin/img/login-bg/login-bg-15.jpg" style="background-image: url({$myf_path}/statics/admin/img/login-bg/login-bg-15.jpg)"></a></li>
        <li><a href="javascript:;" data-click="change-bg" data-img="{$myf_path}/statics/admin/img/login-bg/login-bg-14.jpg" style="background-image: url({$myf_path}/statics/admin/img/login-bg/login-bg-14.jpg)"></a></li>
        <li><a href="javascript:;" data-click="change-bg" data-img="{$myf_path}/statics/admin/img/login-bg/login-bg-13.jpg" style="background-image: url({$myf_path}/statics/admin/img/login-bg/login-bg-13.jpg)"></a></li>
        <li><a href="javascript:;" data-click="change-bg" data-img="{$myf_path}/statics/admin/img/login-bg/login-bg-12.jpg" style="background-image: url({$myf_path}/statics/admin/img/login-bg/login-bg-12.jpg)"></a></li>
    </ul>


</div>
<!-- end page container -->
{include file="../Common/BaseJs.tpl"}

<script>
    $(document).ready(function() {
        App.init();

        $(document).on('click', '[data-click="change-bg"]', function(e) {
            e.preventDefault();
            var targetImage = '[data-id="login-cover-image"]';
            var targetImageSrc = 'url(' + $(this).attr('data-img') +')';

            $(targetImage).css('background-image', targetImageSrc);
            $('[data-click="change-bg"]').closest('li').removeClass('active');
            $(this).closest('li').addClass('active');
        });
        
        $("#btnSubmit").click(function () {
            var userid = $("#txtUserId").val();
            var email = $("#txtEmail").val();
            var pwd  = $("#txtPwd").val();
            var repwd  = $("#txtRePwd").val();
            var vcode = $("#txtVcode").val();
            if(userid=='' || userid.length<6 || userid.length>20){
                FreeCms.error('登录名格式错误');
                return;
            }
            if(!FreeCms.checkEmail(email)){
                FreeCms.error('邮箱格式错误');
                return;
            }
            if(pwd=='' || pwd.length<6){
                FreeCms.error('密码格式错误');
                return;
            }
            if(pwd!=repwd){
                FreeCms.error('两次密码输入不相同');
                return;
            }
            if(vcode==''){
                FreeCms.error('验证码不能为空');
                return;
            }

            FreeCms.doEditSubmit();
        })
    });

    function callbackSaveSuccess() {

        FreeCms.success('注册成功,跳转中~',function () {
            var goUrl = $("#goUrl").val();
            window.location.href = goUrl;
        });
    }

    function callbackSaveFail() {
        changeAuthCode();
    }

    function changeAuthCode() {
        var picsrc = $("#vdimgck").attr("src");
        $("#vdimgck").attr("src", picsrc);
        $("#txtVcode").val('');
    }

</script>
</body>
</html>
