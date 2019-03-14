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
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>父级栏目</label>
                        <div class="col-md-9">
                            <select name="pid" class="form-control">
                                <option value="0">顶级栏目</option>
                                {foreach from=$menus item=vo}
                                <option value="{$vo.id}" {if $vo.id eq $pid}selected="selected"{/if}>&emsp;{$vo.spacer}{$vo.name}</option>
                                {/foreach}
                            </select>
                            <small class="f-s-12 text-grey-darker">选择上级栏目</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>栏目名称</label>
                        <div class="col-md-9">
                            <input class="form-control" type="text" name="name" value="{$data.name}"/>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>图标</label>
                        <div class="col-md-9">
                            <input type="hidden" id="txtLitpic" name="icon" value="{$data.icon}" />
                            <input class="btn btn-default btn-sm" type="button" id="uploadFile" value="上传图标">
                            <img src="{if !empty($data.icon)}{$myf_path}/cloud/{$data.icon}?thumbnail=h-90/w-90{/if}" id="imgFile" alt="预览" title="预览" style="{if empty($data.icon)}display:none;{/if}height:50px;margin-right:10px;border:1px solid #ccc;padding:1px;" />
                            <a id="delete_attach" href="javascript:deleteLitpic()"  class="btn btn-danger btn-sm" {if empty($data.icon)} style="display: none"{/if}>删除图标</a>
                            <br/>
                            <small class="f-s-12 text-grey-darker">缩略图仅支持jpg、png格式，且大小不能超过1M</small>
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
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>描述</label>
                        <div class="col-md-9">
                            <textarea class="form-control" rows="3" name="description">{$data.description}</textarea>
                        </div>
                    </div>
                </form>
            </div>
            <!-- end col-12 -->
        </div>
        <!-- end row -->
    </div>

    <input type="hidden" id="submitUrl" value="{$myf_path}/admin/forum/column/save">
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
            var src = data.url+"?thumbnail=h-90/w-90";
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
