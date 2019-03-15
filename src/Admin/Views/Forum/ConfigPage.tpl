<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">站点</li>
    <li class="breadcrumb-item">论坛管理</li>
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
    <div class="col-lg-12">
        <!-- begin panel -->
        <div class="panel panel-inverse" data-sortable-id="index-1">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <div class="panel-heading-btn">
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                </div>
                <h4 class="panel-title">论坛基本参数</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body p-30 ">
                <form autocomplete="off">

                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>论坛名称</label>
                        <div class="col-md-6">
                            <input class="form-control value"  did="{$config.sys_cfg_forum_title.id}" tabindex="1" maxlength="60" id="sys_cfg_forum_title" name="sys_cfg_forum_title" type="text" size="15" value="{$config.sys_cfg_forum_title.value}" />
                            <small class="f-s-12 text-grey-darker">论坛名称不超过60字符</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right">论坛关键字</label>
                        <div class="col-md-6">
                            <input class="form-control value"  did="{$config.sys_cfg_forum_keywords.id}" tabindex="2" maxlength="60" id="sys_cfg_forum_keywords" name="sys_cfg_forum_keywords" type="text" size="15" value="{$config.sys_cfg_forum_keywords.value}" />
                            <small class="f-s-12 text-grey-darker">多个关键字用逗号隔开</small>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-form-label col-md-3 text-right"><span class="text-red">*</span>论坛描述</label>
                        <div class="col-md-6">
                            <textarea rows="4" class="form-control value" did="{$config.sys_cfg_forum_description.id}" tabindex="3" maxlength="250" name="sys_cfg_forum_description" id="sys_cfg_forum_description">{$config.sys_cfg_forum_description.value}</textarea>
                            <small class="f-s-12 text-grey-darker">描述不能超过250字</small>
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
        <div class="panel">
            <div class="panel-body text-right">
                <button type="button" onclick="FreeCms.batchSave('value');" class="btn btn-primary">确认保存</button>&nbsp;&nbsp;
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="saveUrl" value="{$myf_path}/admin/forum/config/save">

<script type="text/javascript">

    function callbackSaveSuccess() {
        FreeCms.callbackEditSaveSuccess();
    }

</script>

