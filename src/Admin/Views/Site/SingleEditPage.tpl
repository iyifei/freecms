<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">站点</li>
    <li class="breadcrumb-item">单页管理</li>
    <li class="breadcrumb-item active">
        {if $method eq 'add'}
            添加单页
        {else}
            修改单页
        {/if}
    </li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    单页管理
    <small>
        {if $method eq 'add'}
        添加单页
        {else}
        修改单页
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
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>页面标题</label>
                        <div class="col-md-9">
                            <input class="form-control" required="required" maxlength="60" id="title" name="title" type="text" size="15" value="{$data.title}">
                            <small>输入页面标题，最多60字符</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>文件名称</label>
                        <div class="col-md-2" style="vertical-align: center">/pages/</div>
                        <div class="col-md-5">
                            <input class="form-control" required="required"  maxlength="60" title="filename" name="filename" type="text" value="{if empty($data)}newfile{$filename}{else}{$data.filename}{/if}">
                        </div>
                        <div class="col-md-2">.html</div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>选择模板</label>
                        <div class="col-md-9">
                            <select name="template" id="template" class="form-control">
                                {foreach from=$templates item=vo}
                                    <option value="{$vo}" {if $vo eq $selTemplate}selected="selected"{/if}>{$vo}</option>
                                {/foreach}
                            </select>
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
                        <label class="col-form-label col-md-3 text-right">排序</label>
                        <div class="col-md-9">
                            <input class="form-control" name="sortrank" type="text" value="{if $data}{$data.sortrank}{else}50{/if}" />
                            <small class="f-s-12 text-grey-darker">越小越靠前</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-sm-3 col-form-label text-right">关联标识</label>
                        <div class="col-sm-9">
                            <input class="form-control" maxlength="50" name="subgroup" type="text" value="{if empty($data)}default{else}{$data.subgroup}{/if}">
                            <small class="f-s-12 text-grey-darker">通过这个标识来识别类同页面，模板中用{singlelist id='标识'/}调用有相同标识的页面</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-sm-3 col-form-label text-right">页面缩略图</label>
                        <div class="col-sm-9">
                            <input type="hidden" id="txtLitpic" name="litpic" value="{$data.litpic}" />
                            <small class="f-s-12 text-grey-darker">缩略图仅支持jpg、gif、png、bmp格式，且大小不能超过1M</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-sm-3 col-form-label text-right">关键字</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="keywords" value="{$data.keywords}" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-sm-3 col-form-label text-right">摘要</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" rows="5" name="description">{$data.description}</textarea>
                            <textarea name="body" id="editorBody" style="display: none"></textarea>
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
                <h4 class="panel-title">页面内容</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body">
                <form autocomplete="off">
                    <div class="form-group row m-b-15">
                        <div class="col-sm-12">
                            <script id="editor" type="text/plain" style="width:100%;height:400px;">{$data.body}</script>
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

<input type="hidden" id="submitUrl" value="{$myf_path}/admin/site/page/save">

<script type="text/javascript" charset="utf-8" src="{$myf_path}/statics/admin/plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="{$myf_path}/statics/admin/plugins/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="{$myf_path}/statics/admin/plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">

    var ue = UE.getEditor('editor');

    function callbackSaveSuccess() {
        FreeCms.callbackEditSaveSuccess();
    }

    function beforeSubmitFun() {
        $("#editorBody").val(ue.getContent());
    }

</script>

