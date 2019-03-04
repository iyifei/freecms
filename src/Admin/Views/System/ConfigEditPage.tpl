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
                    <input type="hidden" name="method" value="{$method}" />
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>变量类型：</label>
                        <div class="col-md-9">
                            <label><input type="radio" name="type" value="string" checked="checked" onclick="changeValueType('string')">文本</label>
                            <label><input type="radio" name="type" value="text" onclick="changeValueType('text')">多行文本</label>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>变量名：</label>
                        <div class="col-md-9">
                            user_cfg_<input class="mr10 fm-text" style="margin-top: 0;width:296px;" tabindex="1" maxlength="40" id="varname" name="varname" required="required" type="text" size="15" value="">
                            <small class="f-s-12 text-grey-darker">
                                变量名为数字、字母、下划线组合。
                            </small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>变量说明</label>
                        <div class="col-md-9">
                            <input class="form-control" tabindex="2" maxlength="100" id="info" name="info" required="required" type="text" size="15" value="">
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3">变量值</label>
                        <div class="col-md-9">
                            <input class="form-control" tabindex="3" id="txtValue" name="value" type="text" size="15" value="">
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>分组</label>
                        <div class="col-md-9">
                            <input class="form-control" maxlength="30" id="subgroup" name="subgroup"  type="text" value="default">
                            <small class="f-s-12 text-grey-darker">
                                变量名为数字、字母、下划线组合。
                            </small>
                        </div>
                    </div>
                </form>
            </div>
            <!-- end col-12 -->
        </div>
        <!-- end row -->
    </div>

    <input type="hidden" id="submitUrl" value="{$myf_path}/admin/system/config/save">
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

    </script>
</body>
</html>
