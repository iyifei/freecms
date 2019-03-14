<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">系统</li>
    <li class="breadcrumb-item active">论坛栏目</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    论坛栏目管理
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
                <h4 class="panel-title">论坛栏目管理</h4>
            </div>
            <!-- end panel-heading -->

            <!-- begin panel-body -->
            <div class="panel-body">
                <div class="table-responsive">
                <div class="dt-buttons btn-group p-b-15">
                    <a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-buttons" href="javascript:FreeCms.batchSave('sortrank');"><span>更新排序</span></a>
                    <a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-buttons"
                       data-href="{$myf_path}/admin/forum/column/edit?method=add"
                       href="javascript:openModel('btnAddTopMenu')"
                       data-title="添加栏目"
                       id="btnAddTopMenu"
                    ><span>添加顶级栏目</span></a>
                </div>

                <table id="data-table-buttons" class="table table-condensed table-hover myf-table-bordered myf-table-td-center">
                    <thead>
                        <tr>
                            <th width="2%">排序</th>
                            <th width="2%" data-orderable="false">ID</th>
                            <th class="text-nowrap ">栏目名称</th>
                            <th width="15%" class="text-nowrap ">主题数</th>
                            <th width="20%" class="text-nowrap ">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    {foreach from=$datas key=k item=vo}
                        <tr>
                            <td width="1%" class="f-s-600 text-inverse">
                                <input class="left mr10 fm-text sortrank"
                                       tabindex="{$k+50}"
                                       autocomplete="off"
                                       style="margin-top: 0;width:30px;text-align: center"  onkeyup="if (isNaN(value)) execCommand('undo')"
                                       onafterpaste="if(isNaN(value))execCommand('undo')"
                                       name="sortrank_{$vo.id}" did="{$vo.id}" type="text"  value="{$vo.sortrank}">
                            </td>
                            <td width="1%">{$vo.id}</td>
                            <td class="myf-td-left">
                                {if !empty($vo.icon)}
                                    <img src="{$myf_path}/cloud/{$vo.icon}?thumbnail=h-90/w-90" style="width:30px;height:30px;">
                                {/if}
                                {$vo.spacer}{$vo.name|escape:'html'}
                            </td>
                            <td class="">
                                {if $vo.pid > 0}
                                {$vo.subjectCount}
                                {/if}
                            </td>
                            <td class="">
                                <a title="添加子栏目" data-toggle="tooltip"
                                   data-href="{$myf_path}/admin/forum/column/edit?method=add&pid={$vo.id}"
                                   href="javascript:openModel('btnAddChild_{$vo.id}')"
                                   data-title="添加栏目"
                                   id="btnAddChild_{$vo.id}" class="btn btn-primary btn-icon btn-circle btn-sm">
                                    <i class="fas fa-plus"></i>
                                </a>
                                <a title="编辑栏目"  data-toggle="tooltip"
                                   data-href="{$myf_path}/admin/forum/column/edit?method=update&id={$vo.id}"
                                   href="javascript:openModel('btnEdit_{$vo.id}')"
                                   data-title="编辑栏目"
                                   id="btnEdit_{$vo.id}" class="btn btn-warning btn-icon btn-circle btn-sm">
                                    <i class="fas fa-pencil-alt"></i>
                                </a>
                                <a href="javascript:FreeCms.deleteRow({$vo.id});" title="删除"  data-toggle="tooltip"
                                   class="btn btn-danger btn-icon btn-circle btn-sm"><i class="fa fa-times"></i>
                                </a>
                            </td>
                        </tr>
                    {/foreach}
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
<input type="hidden" id="saveUrl" value="{$myf_path}/admin/forum/column/save">
<input type="hidden" id="deleteUrl" value="{$myf_path}/admin/forum/column/save">

<script type="text/javascript">
</script>

