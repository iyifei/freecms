<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">站点</li>
    <li class="breadcrumb-item">音频管理</li>
    <li class="breadcrumb-item active">
        {if $method eq 'add'}
        添加音频
        {else}
        修改音频
        {/if}
    </li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    音频管理
    <small>
        {if $method eq 'add'}
        添加音频
        {else}
        修改音频
        {/if}
    </small>
</h1>


<!-- begin row -->
<div class="row">
    <!-- begin col-6 -->
    <div class="col-lg-6">
        <!-- begin panel -->
        <div class="panel panel-inverse" data-sortable-id="index-1">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <div class="panel-heading-btn">
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                </div>
                <h4 class="panel-title">基本信息</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body p-30 ">
                <form autocomplete="off">
                    <input type="hidden" name="id" value="{$data.id}">
                    <input type="hidden" name="method" value="{$method}" />
                    <input type="hidden" name="mediatype" value="{$channel}">
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>音频标题</label>
                        <div class="col-md-9">
                            <input class="form-control" required="required" maxlength="60" id="title" name="title" type="text" size="15" value="{$data.title}">
                            <small>输入页面标题，最多60字符</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">自定义属性</label>
                        <div class="col-md-9">
                            <label><input class="np" type="checkbox" name="istop" value="1">置顶</label>
                            <label>
                                <input class="np" type="checkbox" name="flags[]" id="flagsh" value="h" {if isset($h)}checked="checked"{/if} >
                                头条[h]</label>
                            <label>
                                <input class="np" type="checkbox" name="flags[]" id="flagsc" value="c" {if isset($c)}checked="checked"{/if} >
                                推荐[c]</label>
                            <label>
                                <input class="np" type="checkbox" name="flags[]" id="flagsf" value="f" {if isset($f)}checked="checked"{/if} >
                                幻灯[f]</label>
                            <label>
                                <input class="np" type="checkbox" name="flags[]" id="flagsa" value="a" {if isset($a)}checked="checked"{/if} >
                                特荐[a]</label>
                            <label>
                                <input class="np" type="checkbox" name="flags[]" id="flagsp" value="p" {if isset($p)}checked="checked"{/if} >
                                图片[p]</label>
                            <label>
                                <input class="np" type="checkbox" name="flags[]" id="flagsj" value="j" {if isset($j)}checked="checked"{/if} >
                                跳转[j]</label>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>文章栏目</label>
                        <div class="col-md-9">
                            <select name="typeid" id="typeid" class="form-control">
                                <option value="0">请选择所属栏目...</option>
                                {foreach from=$arctypes item=vo}
                                    <option value="{$vo.id}" {if $vo.id eq $data.typeid}selected="selected"{/if}>
                                        {$vo.spacer}{$vo.typename}
                                        {if $vo.type eq 'face'}
                                            (*封面)
                                        {/if}
                                    </option>
                                {/foreach}
                            </select>
                            <small class="f-s-12 text-grey-darker">带*的栏目为不可选栏目</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>音频文件</label>
                        <div class="col-md-9">
                            <input type="text" readonly="readonly" required="required" class="form-control" id="url" name="url" value="{$data.addOnMedia.url}" />
                            <input class="btn btn-default btn-sm" type="button" id="uploadMediaFile" value="上传音频">
                            <a id="delete_url_attach" href="javascript:deleteMedia()"  class="btn btn-danger btn-sm" {if empty($data.addOnMedia.url)} style="display: none"{/if}>删除音频</a>
                            <br/>
                            <small class="f-s-12 text-grey-darker">支持mp3格式音频，且大小不能超过20M</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">音频配图</label>
                        <div class="col-md-9">
                            <input type="hidden" id="txtLitpic" name="litpic" value="{$data.litpic}" />
                            <input class="btn btn-default btn-sm" type="button" id="uploadFile" value="上传图片">
                            <img src="{if !empty($data.litpic)}{$myf_path}/cloud/{$data.litpic}?thumbnail=h-90{/if}" id="imgFile" alt="音频配图预览" title="音频配图预览" style="{if empty($data.litpic)}display:none;{/if}height:50px;margin-right:10px;border:1px solid #ccc;padding:1px;" />
                            <a id="delete_attach" href="javascript:deleteLitpic()"  class="btn btn-danger btn-sm" {if empty($data.litpic)} style="display: none"{/if}>删除图片</a>
                            <br/>
                            <small class="f-s-12 text-grey-darker">配图仅支持jpg、gif、png、bmp格式，且大小不能超过1M</small>
                        </div>
                    </div>
                </form>
            </div>
            <!-- end panel-body -->
        </div>
        <!-- end panel -->
    </div>
    <!-- end col-6 -->

    <!-- begin col-6 -->
    <div class="col-lg-6">
        <!-- begin panel -->
        <div class="panel panel-inverse" data-sortable-id="index-2">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <div class="panel-heading-btn">
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                </div>
                <h4 class="panel-title">其他属性</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body p-30 ">
                <form autocomplete="off">
                    <div class="form-group row m-b-15">
                        <label class="col-sm-3 col-form-label text-right">关键字</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="text" name="keywords" value="{$data.keywords}" />
                            <small class="f-s-12 text-grey-darker">多个关键字用逗号隔开</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-sm-3 col-form-label text-right">摘要</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" rows="5" name="description">{$data.description}</textarea>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-sm-3 col-form-label text-right">文章来源</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="text" name="source" value="{$data.source}" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-sm-3 col-form-label text-right">作者</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="text" name="writer" value="{$data.writer}" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-sm-3 col-form-label text-right">发布时间</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="text" name="pubtime" value="{if empty($data)}{$now}{else}{$data.pubtime}{/if}" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-sm-3 col-form-label text-right">浏览次数</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="text" name="click" value="{if empty($data)}0{else}{$data.click}{/if}" onkeyup="if (isNaN(value))
                                                                                                execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" />
                        </div>
                    </div>
                </form>
            </div>
            <!-- end panel-body -->
        </div>
        <!-- end panel -->
    </div>
    <!-- end col-6 -->
</div>
<!-- end row -->

<div class="row">
    <div class="col-lg-12">
        <!-- begin panel -->
        <div class="panel panel-inverse" data-sortable-id="index-3">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <div class="panel-heading-btn">
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                </div>
                <h4 class="panel-title">音频内容</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body">
                <form autocomplete="off">

                    <div class="form-group row m-b-15">
                        <div class="col-sm-12">
                            <script id="editor" type="text/plain" style="width:100%;height:400px;">
                                {if !empty($data)}
                                {$data.addOnMedia.body}
                                {/if}
                            </script>
                        </div>
                    </div>
                </form>
            </div>
            <!-- end panel-body -->
        </div>
        <!-- end panel -->
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel">
            <div class="panel-body text-right">
                <button type="button" onclick="FreeCms.doEditSubmit();" class="btn btn-primary">确认保存</button>&nbsp;&nbsp;
                <a href="javascript:window.history.back(-1);" class="btn btn-default">返回</a>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="submitUrl" value="{$myf_path}/admin/content/audio/save">
<script type="text/javascript" charset="utf-8" src="{$myf_path}/statics/admin/plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="{$myf_path}/statics/admin/plugins/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="{$myf_path}/statics/admin/plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">

    var ue = UE.getEditor('editor');

    FreeCms.initUploader('uploadFile');
    FreeCms.initUploader('uploadMediaFile');


    function callbackSaveSuccess() {
        FreeCms.callbackEditSaveSuccess();
    }

    function uploadCallback(data,btn) {
        if(btn=='uploadFile'){
            var src = data.url+"?thumbnail=h-90";
            $("#txtLitpic").val(data.key);
            $("#imgFile").attr('src',src).show();
            $("#delete_attach").show();
        }else if(btn=='uploadMediaFile'){
            $("#url").val(data.key);
            $("#delete_url_attach").show();
        }
    }

    function deleteLitpic() {
        $("#txtLitpic").val('');
        $("#imgFile").attr('src','').hide();
        $("#delete_attach").hide();
    }

    function deleteMedia() {
        $("#url").val('');
        $("#delete_url_attach").hide();
    }
</script>

