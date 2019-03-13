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
                    <label class="col-form-label col-md-3"><span class="text-red">*</span>广告位标识</label>
                    <div class="col-md-9">
                        <input class="form-control" id="uuid" name="uuid" maxlength="200" type="text" value="{$data.uuid}">
                    </div>
                </div>
                <div class="form-group row m-b-15">
                    <label class="col-form-label col-md-3"><span class="text-red">*</span>广告位名称</label>
                    <div class="col-md-9">
                        <input class="form-control" type="text" name="name" maxlength="30" value="{$data.name}"/>
                    </div>
                </div>
                <div class="form-group row m-b-15">
                    <label class="col-form-label col-md-3"><span class="text-red">*</span>时间限制</label>
                    <div class="col-md-9">
                        <label>
                            <input type="radio" name="timetype" {if empty($data.timetype)}checked="checked"{/if} value="0">
                            永不过期
                        </label>
                        <label>
                            <input type="radio" name="timetype" {if $data.timetype eq 1}checked="checked"{/if} value="1">
                            限定时间范围
                        </label>
                    </div>
                </div>
                <div class="form-group row m-b-15">
                    <label class="col-form-label col-md-3">投放时间</label>
                    <div class="col-md-9">
                        <div class="input-group input-daterange" data-date-format="yyyy-mm-dd">
                            <input type="text" value="{$data.starttime|date_format:'%Y-%m-%d'}" autocomplete="off" class="form-control" id="txtStartDate" name="starttime" placeholder="开始日期">
                            <span class="input-group-addon">to</span>
                            <input type="text" value="{$data.endtime|date_format:'%Y-%m-%d'}" autocomplete="off"  class="form-control" id="txtEndDate" name="endtime" placeholder="结束日期">
                        </div>
                    </div>
                </div>
                <div class="form-group row m-b-15">
                    <label class="col-form-label col-md-3">广告内容</label>
                    <div class="col-md-9">
                        <textarea class="form-control" rows="5" name="body">{$data.body}</textarea>
                        <small class="f-s-12 text-grey-darker">广告内容支持html代码</small>
                    </div>
                </div>
                <div class="form-group row m-b-15">
                    <label class="col-form-label col-md-3">过期显示内容</label>
                    <div class="col-md-9">
                        <textarea class="form-control" rows="5" name="expirebody">{$data.expirebody}</textarea>
                        <small class="f-s-12 text-grey-darker">过期广告内容也支持html代码</small>
                    </div>
                </div>
            </form>
        </div>
        <!-- end col-12 -->
    </div>
    <!-- end row -->
</div>

<input type="hidden" id="submitUrl" value="{$myf_path}/admin/site/ad/save">
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

    $(function () {
        $('.input-daterange').datepicker({
            language:"zh-CN"
        });
    })
</script>
</body>
</html>
