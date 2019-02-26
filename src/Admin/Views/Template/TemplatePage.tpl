<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">模板</li>
    <li class="breadcrumb-item active">模板管理</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    模板管理管理
</h1>
<!-- end page-header -->

<!-- begin row -->
<div class="row">
    <!-- begin col-10 -->
    <div class="col-lg-12">
        <!-- begin panel -->
        <div class="panel panel-inverse">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <div class="panel-heading-btn">
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i
                                class="fa fa-expand"></i></a>
                </div>
                <h4 class="panel-title">当前主题模板列表</h4>
            </div>
            <!-- end panel-heading -->

            <!-- begin panel-body -->
            <div class="panel-body">
                <div class="table-responsive">
                <div class="dt-buttons btn-group p-b-15">
                    <a class="btn btn-default buttons-html5 btn-sm" tabindex="0"
                       aria-controls="data-table-buttons"
                       href="#!template/template/edit?method=add"
                    ><span>添加模板</span></a>
                </div>

                <table id="data-table-buttons" class="table table-condensed table-hover myf-table-bordered myf-table-td-center">
                    <thead>
                        <tr>
                            <th class="text-nowrap ">文件名</th>
                            <th class="text-nowrap ">文件描述</th>
                            <th class="text-nowrap ">修改时间</th>
                            <th width="20%" class="text-nowrap ">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    {foreach from=$files key=k item=vo}
                        <tr>
                            <td>
                                {$vo.filename|escape:'html'}
                            </td>
                            <td>
                                {$vo.info|escape:'html'}
                            </td>
                            <td>
                                {$vo.updatetime}
                            </td>
                            <td class="">
                                <a title="编辑" data-toggle="tooltip"
                                   href="#!template/template/edit?method=update&id={$vo.filename}"
                                   class="btn btn-warning btn-icon btn-circle btn-sm">
                                    <i class="fas fa-pencil-alt"></i>
                                </a>
                                {if empty($vo.default)}
                                <a href="javascript:FreeCms.deleteRow('{$vo.filename}');" title="删除"  data-toggle="tooltip"
                                   class="btn btn-danger btn-icon btn-circle btn-sm"><i class="fa fa-times"></i>
                                </a>
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                    <tr>
                        <td colspan="4">
                            <small class="text-red">[温馨提示：请谨慎修改、删除模板，此操作不可恢复!]</small>
                        </td>
                    </tr>
                    </tbody>
                </table>
                </div>
            </div>
            <!-- end panel-body -->
        </div>
        <!-- end panel -->
    </div>
    <!-- end col-10 -->
</div>
<!-- end row -->
<input type="hidden" id="deleteUrl" value="{$myf_path}/admin/template/template/save">
<input type="hidden" id="saveUrl" value="{$myf_path}/admin/template/template/save">

<script type="text/javascript">
</script>

