<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
   {include file="../Common/Head.tpl"}
</head>
<body style="background: none">
    <!-- begin #content -->
    <div class="content-full-width">
        <!-- begin row -->
        <div class="row">
            <!-- begin col-12 -->
            <div class="col-lg-12">
                <form autocomplete="off">
                    <input type="hidden" name="id" value="{$data.id}">
                    <input type="hidden" name="method" value="{$method}" />
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>登录名</label>
                        <div class="col-md-9">
                            {if $method eq 'update'}
                                {$data.userid}
                                <input type="hidden" name="userid" value="{$data.userid}">
                            {else}
                                <input class="form-control" maxlength="30"  required="required" id="userid" name="userid" type="text" size="15" value="{$data.userid}">
                                <small class="f-s-12 text-grey-darker">建议6~20位字符串</small>
                            {/if}
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3">{if $method eq 'add'}<span class="tred">*</span>{/if}登录密码</label>
                        <div class="col-md-9">
                            <input class="form-control" type="text" name="name" value="{$data.name}"/>
                            <small class="f-s-12 text-grey-darker">
                                {if $method eq 'update'}密码留空代表不修改密码；{/if}
                                推荐8~30位数字+字母+特殊字符串组合
                            </small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>冻结状态</label>
                        <div class="col-md-9">
                            &nbsp;
                            <label><input type="radio" name="frozen" checked="checked" value="0">&nbsp;正常</label>
                            <label><input type="radio" name="frozen" value="1" {if $data.sex eq '1'}checked="checked"{/if}>&nbsp;冻结登录</label>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3">性别</label>
                        <div class="col-md-9">
                            &nbsp;
                            <label><input type="radio" name="sex" checked="checked" value="保密">&nbsp;保密</label>
                            <label><input type="radio" name="sex" value="男" {if $data.sex eq '男'}checked="checked"{/if}>&nbsp;男</label>
                            <label><input type="radio" name="sex" value="女" {if $data.sex eq '女'}checked="checked"{/if}>&nbsp;女</label>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3">昵称</label>
                        <div class="col-md-9">
                            <input class="form-control" maxlength="30" id="uname" name="uname" type="text" size="15" value="{$data.uname}">
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3">邮箱</label>
                        <div class="col-md-9">
                            <input class="form-control" maxlength="50" id="email" name="email" type="text" size="15" value="{$data.email}">
                        </div>
                    </div>

                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3">头像</label>
                        <div class="col-md-9">
                            <input type="hidden" id="txtLitpic" name="avatar" value="{$data.avatar}" />
                            <input class="btn btn-default btn-sm" type="button" id="uploadFile" value="上传头像">
                            <img src="{if !empty($data.avatar)}{$myf_path}/cloud/{$data.avatar}?thumbnail=h-90{/if}" id="imgFile" alt="缩略图预览" title="缩略图预览" style="{if empty($data.avatar)}display:none;{/if}height:50px;margin-right:10px;border:1px solid #ccc;padding:1px;" />
                            <a id="delete_attach" href="javascript:deleteLitpic()"  class="btn btn-danger btn-sm" {if empty($data.avatar)} style="display: none"{/if}>删除图片</a>
                            <br/>
                            <small class="f-s-12 text-grey-darker">缩略图仅支持jpg、gif、png、bmp格式，且大小不能超过1M</small>
                        </div>
                    </div>
                </form>
            </div>
            <!-- end col-12 -->
        </div>
        <!-- end row -->
    </div>

    <input type="hidden" id="submitUrl" value="{$myf_path}/admin/member/member/save">
    <!-- end #content -->
    <!-- end page container -->
    {include file="../Common/BaseJs.tpl"}

    <script>
        function submitForm() {
            FreeCms.doEditSubmit();
        }

        function callbackSaveSuccess() {
            window.parent.successCallback();
        }

        FreeCms.initUploader('uploadFile');

        function uploadCallback(data,btnId) {
            var src = data.url+"?thumbnail=h-90";
            $("#txtLitpic").val(data.key);
            $("#imgFile").attr('src',src).show();
            $("#delete_attach").show();
        }

        function deleteLitpic() {
            $("#txtLitpic").val('');
            $("#imgFile").attr('src','').hide();
            $("#delete_attach").hide();
        }

    </script>
</body>
</html>
