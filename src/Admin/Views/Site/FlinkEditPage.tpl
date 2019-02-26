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
                    <label class="col-form-label col-md-3"><span class="text-red">*</span>网址</label>
                    <div class="col-md-9">
                        <input class="form-control" id="url" name="url" maxlength="200" type="text" value="{$data.url}">
                        <small class="f-s-12 text-grey-darker">输入网址,如：http://www.freecms.com.cn</small>
                    </div>
                </div>
                <div class="form-group row m-b-15">
                    <label class="col-form-label col-md-3"><span class="text-red">*</span>网站名称</label>
                    <div class="col-md-9">
                        <input class="form-control" type="text" name="webname" maxlength="30" value="{$data.webname}"/>
                        <small class="f-s-12 text-grey-darker">输入网站名称,如：freecms</small>
                    </div>
                </div>
                <div class="form-group row m-b-15">
                    <label class="col-form-label col-md-3"><span class="text-red">*</span>关联标识</label>
                    <div class="col-md-9">
                        <input class="form-control" id="subgroup" name="subgroup" type="text" value="{if $data}{$data.subgroup}{else}default{/if}">
                        <small class="f-s-12 text-grey-darker">通过这个标识来识别相同类别的链接，支持字母或数字</small>
                    </div>
                </div>
                <div class="form-group row m-b-15">
                    <label class="col-form-label col-md-3">网站logo</label>
                    <div class="col-md-9">
                        <input type="hidden" id="txtLitpic" name="litpic" value="{$data.logo}" />
                        <small class="f-s-12 text-grey-darker">缩略图仅支持jpg、gif、png、bmp格式，且大小不能超过1M</small>
                    </div>
                </div>
                <div class="form-group row m-b-15">
                    <label class="col-form-label col-md-3">排序</label>
                    <div class="col-md-9">
                        <input id="sortrank" name="sortrank"  class="form-control" type="text" value="{if $data}{$data.sortrank}{else}50{/if}"/>
                        <small class="f-s-12 text-grey-darker">越小越靠前</small>
                    </div>
                </div>
                <div class="form-group row m-b-15">
                    <label class="col-form-label col-md-3">备注</label>
                    <div class="col-md-9">
                        <textarea class="form-control" rows="5" name="remark">{$data.remark}</textarea>
                    </div>
                </div>
            </form>
        </div>
        <!-- end col-12 -->
    </div>
    <!-- end row -->
</div>

<input type="hidden" id="submitUrl" value="{$myf_path}/admin/site/flink/save">
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
