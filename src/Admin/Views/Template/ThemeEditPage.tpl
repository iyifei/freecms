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
                    <input type="hidden" name="old_theme" value="{$theme}">
                    <input type="hidden" name="method" value="{$method}" />
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>主题英文名</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="theme" value="{$theme}">
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>主题名称</label>
                        <div class="col-md-9">
                            <input class="form-control" type="text" name="name" value="{$data.name}"/>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>作者</label>
                        <div class="col-md-9">
                            <input class="form-control" type="text" name="author" value="{$data.author}"/>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>官网</label>
                        <div class="col-md-9">
                            <input class="form-control" id="web" name="web" type="text" value="{$data.web}">
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>版本</label>
                        <div class="col-md-9">
                            <input class="form-control" id="version" name="version" type="text" value="{$data.version}" >
                            <small class="f-s-12 text-grey-darker">格式如：1.0.0</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>颜色</label>
                        <div class="col-md-9">
                            <input class="form-control" id="color" name="color" type="text" value="{$data.color}" >
                            <small class="f-s-12 text-grey-darker">输入主题颜色风格,格式如：红色,red</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>模板缩略图</label>
                        <div class="col-md-9">
                            <input type="hidden" id="txtLitpic" name="litpic" value="{$data.litpic}" />
                            <input class="btn btn-default btn-sm" type="button" id="uploadFile" value="上传图片" onclick="FreeCms.simpleUpload()">
                            <img src="{if !empty($data.litpic)}{$data.litpic}{/if}" id="imgFile" alt="缩略图预览" title="缩略图预览" style="{if empty($data.litpic)}display:none;{/if}height:50px;margin-right:10px;border:1px solid #ccc;padding:1px;" />
                            <a id="delete_attach" href="javascript:deleteLitpic()"  class="btn btn-danger btn-sm" {if empty($data.litpic)} style="display: none"{/if}>删除图片</a>
                            <br/>
                            <small class="f-s-12 text-grey-darker">缩略图仅支持jpg、gif、png、bmp格式，且大小不能超过1M</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>描述</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" rows="5" name="description">{$data.description}</textarea>
                        </div>
                    </div>
                </form>
            </div>
            <!-- end col-12 -->
        </div>
        <!-- end row -->
    </div>

    <input type="hidden" id="submitUrl" value="{$myf_path}/admin/template/theme/save">
    <!-- end #content -->
    <!-- end page container -->
    {include file="../Common/BaseJs.tpl"}

    <script type="text/javascript" charset="utf-8" src="{$myf_path}/statics/admin/plugins/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="{$myf_path}/statics/admin/plugins/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="{$myf_path}/statics/admin/plugins/ueditor/lang/zh-cn/zh-cn.js"></script>

    <script>

        FreeCms.initUploadEditor();

        function submitForm() {
            FreeCms.doEditSubmit();
        }

        function callbackSaveSuccess() {
            window.parent.successCallback();
        }

        function uploadSingleImageCallbackFun(src) {
            $("#txtLitpic").val(src);
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
