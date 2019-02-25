<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <link href="<{$myf_path}>/statics/admin/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="<{$myf_path}>/statics/admin/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<{$myf_path}>/statics/admin/css/default/style.min.css" rel="stylesheet" />
    <link href="<{$myf_path}>/statics/admin/css/default/style-responsive.min.css" rel="stylesheet" />
    <style>
        body {
            font-size: 12px;
            background: none;
            font-family: 'Open Sans',"Helvetica Neue",Helvetica,Arial,sans-serif;
            color: #707478;
            line-height: 1.42857143;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
    </style>
</head>
<body style="background: none">
    <!-- begin #content -->
    <div class="content-full-width">
        <!-- begin row -->
        <div class="row">
            <!-- begin col-12 -->
            <div class="col-lg-12">
                <form autocomplete="off">
                    <input type="hidden" name="id" value="<{$data.id}>">
                    <input type="hidden" name="method" value="<{$method}>" />
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>父级菜单</label>
                        <div class="col-md-9">
                            <select name="pid" class="form-control">
                                <option value="0">顶级菜单</option>
                                <{foreach from=$menus item=vo}>
                                <option value="<{$vo.id}>" <{if $vo.id eq $pid}>selected="selected"<{/if}>>&emsp;<{$vo.spacer}><{$vo.name}></option>
                                <{/foreach}>
                            </select>
                            <small class="f-s-12 text-grey-darker">选择上级菜单</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>菜单名称</label>
                        <div class="col-md-9">
                            <input class="form-control" type="text" name="name" value="<{$data.name}>"/>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>访问地址</label>
                        <div class="col-md-9">
                            <input class="form-control" id="url" name="url" type="text" value="<{$data.url}>">
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3">排序</label>
                        <div class="col-md-9">
                            <input id="sortrank" name="sortrank"  class="form-control" type="text" value="<{if $data}><{$data.sortrank}><{else}>50<{/if}>"/>
                            <small class="f-s-12 text-grey-darker">越小越靠前</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3">是否隐藏</label>
                        <div class="col-md-9">
                            <label>
                                <input type="checkbox" name="ishide" value="1" <{if $data.ishide eq 1}>checked="checked"<{/if}> >
                                是否隐藏
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <!-- end col-12 -->
        </div>
        <!-- end row -->
    </div>

    <input type="hidden" id="submitUrl" value="<{$myf_path}>/admin/system/menu/save">
    <!-- end #content -->
    <!-- end page container -->
    <{include file="../Common/BaseJs.tpl"}>

    <script>
        function submitForm() {
            FreeCms.doEditSubmit();
        }

        function callbackSaveSuccess() {
            window.parent.successCallback();
        }
    </script>
</body>
</html>
