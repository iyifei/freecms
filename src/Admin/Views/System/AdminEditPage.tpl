<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
   {include file="../Common/ModalHead.tpl"}
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
                            <input class="form-control" maxlength="30" id="userid" name="userid" type="text" value="{$data.userid}">
                            <small class="f-s-12 text-grey-darker">建议5~30位字符串</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3">{if $method eq 'add'}<span class="text-red">*</span>{/if}登录密码</label>
                        <div class="col-md-9">
                            <input class="form-control" type="pwd" name="pwd" value="{$data.name}"/>
                            <small class="f-s-12 text-grey-darker">{if $method eq 'update'}<span>密码留空代表不修改密码</span>{/if}
                                推荐8~30位数字+字母+特殊字符串组合
                            </small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>授权角色</label>
                        <div class="col-md-9">
                            <select name="roleid" class="form-control">
                                <option value="0">===选择角色===</option>
                                {foreach from=$roles item=vo}
                                    <option value="{$vo.id}" {if $vo.id eq $data.roleid}selected="selected"{/if}>{$vo.name}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3">真实姓名</label>
                        <div class="col-md-9">
                            <input class="form-control" maxlength="30" id="rname" name="rname" type="text" value="{$data.rname}">
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3">邮箱</label>
                        <div class="col-md-9">
                            <input class="form-control" maxlength="30" id="email" name="email" type="text" value="{$data.email}">
                        </div>
                    </div>
                </form>
            </div>
            <!-- end col-12 -->
        </div>
        <!-- end row -->
    </div>

    <input type="hidden" id="submitUrl" value="{$myf_path}/admin/system/admin/save">
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

        function iconChange() {
            var fa = $("#icon").val();
            $("#iconContainer").addClass(fa);
        }
    </script>
</body>
</html>
