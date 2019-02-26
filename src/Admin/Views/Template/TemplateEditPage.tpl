<link href="{$myf_path}/statics/admin/plugins/codemirror/codemirror.css" rel="stylesheet" id="theme" />
<style>
    .CodeMirror {
        border: 1px solid #eee;
        height: 500px;
    }

</style>
<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">模板</li>
    <li class="breadcrumb-item">模板管理</li>
    <li class="breadcrumb-item active">
        {if $method eq 'add'}
            添加模板
        {else}
            修改模板
        {/if}
    </li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    模板管理
    <small>
        {if $method eq 'add'}
            添加模板
        {else}
            修改模板
        {/if}
    </small>
</h1>


<!-- begin row -->
<div class="row">
    <!-- begin col-12 -->
    <div class="col-lg-12">
        <!-- begin panel -->
        <div class="panel panel-inverse">
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

                <form autocomplete="off" style="width:60%;">
                    <input type="hidden" name="id" value="{$data.id}">
                    <input type="hidden" name="method" value="{$method}" />
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>模板类型</label>
                        <div class="col-md-9">
                            <select id="tempType" name="tplType" class="form-control">
                                {foreach from=$templates item=vo}
                                    <option value="{$vo.val}" {if $vo.val eq $templateVal}selected="selected"{/if}>{$vo.name}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3"><span class="text-red">*</span>文件名</label>
                        <div class="col-md-9">
                            <input class="form-control" type="text"  id="txtFilename" value="{$name}" {if $name eq 'default'}disabled="disabled"{/if}/>
                            <small class="f-s-12 text-grey-darker">
                                （请输入文件名，只能用'0-9'、'a-z'、'A-Z'以内范围的字符）
                            </small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3">最终文件名</label>
                        <div class="col-md-9">
                            <input type="hidden" name="id" id="txtMyFilename" value="{$filename}"/>
                            <input type="hidden" name="oldfilename" value="{$filename}"/>
                            <div id="divFilename">{$filename}</div>
                        </div>
                    </div>
                </form>
            </div>
            <!-- end panel-body -->
        </div>
        <!-- end panel -->


    </div>
    <!-- end col-12 -->
</div>
<!-- end row -->

<div class="row">
    <div class="col-lg-12">
        <!-- begin panel -->
        <div class="panel panel-inverse" data-sortable-id="index-3">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <div class="panel-heading-btn">
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i
                                class="fa fa-expand"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning"
                       data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                </div>
                <h4 class="panel-title">模板内容</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body">
                <form autocomplete="off">

                    <div class="form-group row m-b-15">
                        <div class="col-sm-12">
                            <textarea class="left fm-text" name="content"
                                      id="templateCode">{$content}</textarea>
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

<input type="hidden" id="submitUrl" value="{$myf_path}/admin/template/template/save">

<script src="{$myf_path}/statics/admin/plugins/codemirror/codemirror.js"></script>
<script src="{$myf_path}/statics/admin/plugins/codemirror/xml.js"></script>

<script>

    function callbackSaveSuccess() {
        FreeCms.callbackEditSaveSuccess();
    }

    function setTemplate() {
        var tpltype = $("#tempType").val();
        var fn = $("#txtFilename").val();
        var filename = tpltype + fn + ".tpl";
        $("#divFilename").html(filename);
        $("#txtMyFilename").val(filename);
    }

    $("document").ready(function () {
        $("#tempType").change(function () {
            setTemplate();
        });
        $("#txtFilename").keyup(function () {
            setTemplate();
        });

        var codeEditor = CodeMirror.fromTextArea(document.getElementById("templateCode"), {
            lineNumbers: true,     // 显示行号
            indentUnit: 4,         // 缩进单位为4
            styleActiveLine: true, // 当前行背景高亮
            matchBrackets: true,   // 括号匹配
            smartIndent: true,
            lineWrapping: true,
            mode: 'text/html'    // HMTL混合模式
        });
        codeEditor.on("change",function(){
            $("#templateCode").text(codeEditor.getValue());
        });

    });
</script>