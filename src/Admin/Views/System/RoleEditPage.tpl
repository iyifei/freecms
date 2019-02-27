<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
   {include file="../Common/Head.tpl"}
    <link href="{$myf_path}/statics/admin/plugins/jstree/dist/themes/default/style.min.css" rel="stylesheet" />
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
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>角色名称</label>
                        <div class="col-md-9">
                            <input class="form-control" maxlength="30" id="name" name="name" type="text" value="{$data.name}">
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>授权菜单</label>
                        <div class="col-md-9">
                            <input type="hidden" value="{$data.menuids}" required="required" id="menuids" name="menuids">
                            <div id="roleMenuTree"></div>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3">备注</label>
                        <div class="col-md-9">
                            <textarea class="form-control" rows="3" name="remark">{$data.remark}</textarea>
                        </div>
                    </div>
                </form>
            </div>
            <!-- end col-12 -->
        </div>
        <!-- end row -->
    </div>

    <input type="hidden" id="submitUrl" value="{$myf_path}/admin/system/role/save">
    <!-- end #content -->
    <!-- end page container -->
    {include file="../Common/BaseJs.tpl"}
    <script src="{$myf_path}/statics/admin/plugins/jstree/dist/jstree.min.js"></script>
    <script>
        function submitForm() {
            FreeCms.doEditSubmit();
        }

        function callbackSaveSuccess() {
            window.parent.successCallback();
        }

        $('#roleMenuTree').jstree({
            'plugins':
                ["wholerow","checkbox"],
            'core' : {
                'data' : {$menuJson}
            }
        }).on('loaded.jstree',function (event,data) {
            var menuIds = $("#menuids").val();
            if(menuIds!=''){
                $("#roleMenuTree").jstree("select_node",menuIds.split(','),true);
            }
        });

        function beforeSubmitFun() {
            var ids = $('#roleMenuTree').jstree().get_checked();
            $("#menuids").val(ids);
        }
    </script>
</body>
</html>
