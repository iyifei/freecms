<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    {include file="../Common/head.tpl"}
    <link href="{$myf_path}/statics/public/plugins/mueditor/themes/default/css/umeditor.min.css" type="text/css" rel="stylesheet">
</head>
<body>

{include file="../Common/top.tpl"}

<!-- begin page-title -->
<div class="page-title has-bg">
    <!-- begin bg-cover -->
    <div class="bg-cover">
        <img src="{$myf_path}/statics/public/img/cover/cover-3.jpg" alt="" />
    </div>
    <!-- end bg-cover -->
    <!-- begin container -->
    <div class="container">
        <!-- begin breadcrumb -->
       {$freecms.position}
        <!-- end breadcrumb -->
        <h1>{$freecms.title|escape:'html'}</h1>
    </div>
    <!-- end container -->
</div>
<!-- end page-title -->

<!-- begin content -->
<div class="content">
    <!-- begin container -->
    <div class="container">
        <!-- begin row -->
        <div class="row">
            <!-- begin col-9 -->
            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-3">
                        <div class="text-left">
                            <a href="#replyArea" class="btn btn-primary">快速回帖</a>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <!-- begin pagination -->
                        <div class="text-right">
                            <ul class="pagination m-t-0 m-b-15">
                               {page pagesize="2"}
                            </ul>
                        </div>
                        <!-- end pagination -->
                    </div>
                </div>

                <!-- begin forum-list -->
                <ul class="forum-list forum-detail-list">
                    {postslist id="vo" pagesize="2"}
                    <li>
                        <!-- begin media -->
                        <div class="media">
                            <img src="{$vo.member.avatarThumbUrl}">
                            <span class="label label-danger">
                                {if $vo.index eq 0}
                                    楼主
                                {else if $vo.index eq 1}
                                    沙发
                                {else if $vo.index eq 2}
                                    椅子
                                {else if $vo.index eq 3}
                                    板凳
                                {else if $vo.index eq 4}
                                    地板
                                    {else}
                                    第{$vo.index}楼
                                {/if}
                            </span>
                        </div>
                        <!-- end media -->
                        <!-- begin info-container -->
                        <div class="info-container">
                            <div class="post-user"><a href="#">{$vo.member.uname}</a> <small>：</small></div>
                            <div class="post-content">
                                {$vo.body}
                            </div>
                            <div class="post-time">{$vo.createTime}</div>
                            {if $vo.mid eq $CurrentMember.id || $CurrentAdmin.roleid eq 1}
                            <div style="margin-top:10px;">
                                <a class="btn btn-sm btn-danger" href="javascript:deleteRow('{$vo.enid}','posts');">删除</a>
                            </div>
                            {/if}
                        </div>
                        <!-- end info-container -->
                    </li>
                    {/postslist}
                </ul>
                <!-- end forum-list -->

                <!-- begin pagination -->
                <div class="text-right" id="replyArea">
                    <ul class="pagination m-t-0">
                        {page pagesize="2"}
                    </ul>
                </div>
                <!-- end pagination -->

                <!-- begin comment-section -->
                <div class="comment-banner-msg">
                    {if empty($CurrentMember)}
                        只能登录账户才能发帖，请先<a href="{$myf_path}/member/login?go={$freecms.currUrl}">登录</a>或<a href="{$myf_path}/member/register?go={$freecms.currUrl}">注册</a>账户
                    {else}
                        <span class="text-danger">请遵守文明社区公约言论规则，不得违反国家法律法规</span>
                    {/if}
                </div>
                {if !empty($CurrentMember)}
                <div class="panel panel-forum">
                    <div class="panel-heading">
                        <h4 class="panel-title">回帖</h4>
                    </div>
                    <div class="panel-body">
                        <form method="POST" autocomplete="off">
                            <input type="hidden" id="newSubjectUrl" value="{$myf_path}/forum/posts/{$senid}">
                            <div class="m-t-10">
                                <script type="text/plain" id="myEditor" style="width:100%;height:240px;"></script>
                            </div>
                            <div class="m-t-10">
                                <div class="row">
                                    <div class="col-xs-2">
                                        <input type='text' id="txtCode" class="form-control" maxlength='10'
                                               placeholder="验证码"/>
                                    </div>
                                    <div class="col-xs-2">
                                        <img id='vdimgck' src='{$myf_path}/captcha?w=100&h=35&s=25'
                                             style='border:1px solid #e2e7eb'/>
                                    </div>
                                    <div class="col-xs-6">
                                        <button type="button" id="btnSubmit" class="btn btn-theme">提交保存 <i
                                                    class="fa fa-paper-plane"></i></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                                {/if}
                <!-- end comment-section -->
            </div>
            <!-- end col-9 -->
            <!-- begin col-3 -->
            <div class="col-md-3">
               {include file="../Common/posts_right.tpl"}
            </div>
            <!-- end col-3 -->
        </div>
        <!-- end row -->
    </div>
    <!-- end container -->
</div>
<!-- end content -->

{include file="../Common/footer.tpl"}
<script type="text/javascript" charset="utf-8" src="{$myf_path}/statics/public/plugins/mueditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="{$myf_path}/statics/public/plugins/mueditor/umeditor.min.js"></script>
<script type="text/javascript" src="{$myf_path}/statics/public/plugins/mueditor/lang/zh-cn/zh-cn.js"></script>
<script>
    var um = UM.getEditor('myEditor');

    $(function () {
        $("#btnSubmit").click(function () {
            var url = $("#newSubjectUrl").val();
            var code = $("#txtCode").val();
            var body = UM.getEditor('myEditor').getContent();

            if(body=='' || body.length>10000){
                FreeCms.error("内容不能为空，并且长度为1~10000字符");
                return;
            }
            if(code==''){
                FreeCms.error("请输入图片验证码");
                return;
            }
            var data = {
                code:code,
                body:body,
                type:'reply'
            };
            $.post(url,data,function (res) {
                if(res.status==0){
                    FreeCms.success('帖子回复成功',function () {
                        window.location.href = '{$myf_path}/forum/posts/'+res.data.senid+".html";
                    },600)
                }else{
                    FreeCms.error(res.errmsg);
                    changeAuthCode();
                }
            })
        })
    })

    function changeAuthCode() {
        var picsrc = $("#vdimgck").attr("src");
        $("#vdimgck").attr("src", picsrc);
        $("#txtCode").val('');
    }
</script>
</body>
</html>
