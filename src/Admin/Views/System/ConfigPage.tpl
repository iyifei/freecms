<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">站点</li>
    <li class="breadcrumb-item">栏目管理</li>
    <li class="breadcrumb-item active">
        基本参数
    </li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    基本参数
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
                <h4 class="panel-title">系统参数</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body p-30 ">
                <form autocomplete="off">

                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>网站名称</label>
                        <div class="col-md-9">
                            <input class="form-control value"  did="{$config.sys_cfg_webname.id}" tabindex="1" type="text" maxlength="60" id="sys_cfg_webname" name="sys_cfg_webname" type="text" size="15" value="{$config.sys_cfg_webname.value}" />
                            <small class="f-s-12 text-grey-darker">变量名：【sys_cfg_webname】网站名称不超过60字符</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">网站关键字</label>
                        <div class="col-md-9">
                            <input class="form-control value"  did="{$config.sys_cfg_keywords.id}" tabindex="2" type="text" maxlength="60" id="sys_cfg_keywords" name="sys_cfg_keywords" type="text" size="15" value="{$config.sys_cfg_keywords.value}" />
                            <small class="f-s-12 text-grey-darker">变量名：【sys_cfg_keywords】多个关键字用逗号隔开</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">网站描述</label>
                        <div class="col-md-9">
                            <textarea rows="5" class="form-control value" did="{$config.sys_cfg_description.id}" tabindex="3" maxlength="250" name="sys_cfg_description" id="sys_cfg_description">{$config.sys_cfg_description.value}</textarea>
                            <small class="f-s-12 text-grey-darker">变量名：【sys_cfg_description】描述不能超过250字</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">网站版权</label>
                        <div class="col-md-9">
                            <textarea rows="5" class="form-control value" did="{$config.sys_cfg_copyright.id}" tabindex="4"  name="sys_cfg_copyright" id="sys_cfg_copyright">{$config.sys_cfg_copyright.value}</textarea>
                            <small class="f-s-12 text-grey-darker">变量名：【sys_cfg_copyright】版权信息支持html和script语法</small>
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
                <h4 class="panel-title">自定义参数</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body p-30 ">
                <form autocomplete="off">
                    {foreach from=$userConfigs item=vo}
                        <div class="form-group row m-b-15">
                            <label class="col-sm-3 col-form-label text-right">{$vo.info|escape:'html'}：</label>
                            <div class="col-sm-9">
                                {if $vo.type eq 'text'}
                                    <textarea rows="5" class="form-control value" did="{$vo.id}" name="cfg_{$vo.id}" id="faq_content">{$vo.value}</textarea>
                                {else}
                                    <input class="form-control value" did="{$vo.id}"  name="cfg_{$vo.id}" type="text" size="15" value="{$vo.value}">
                                {/if}
                                <small class="f-s-12 text-blue-lighter">变量名：【{$vo.varname|escape:'html'}】</small><br/>
                                <small class="f-s-12 text-grey-darker">分组名：【{$vo.subgroup}】</small>
                            </div>
                        </div>
                    {/foreach}

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
        <div class="panel">
            <div class="panel-body text-right">
                <button type="button" onclick="FreeCms.batchSave('value');" class="btn btn-primary">确认保存</button>&nbsp;&nbsp;
                <a data-href="{$myf_path}/admin/system/config/edit?method=add"
                   href="javascript:openModel('btnAddConfig')"
                   data-title="添加配置"
                   id="btnAddConfig"
                   class="btn btn-purple">添加配置</a>
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="saveUrl" value="{$myf_path}/admin/system/config/save">

<script type="text/javascript">

    function callbackSaveSuccess() {
        FreeCms.callbackEditSaveSuccess();
    }
</script>

