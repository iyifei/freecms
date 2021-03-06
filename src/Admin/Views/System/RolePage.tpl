<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">系统</li>
    <li class="breadcrumb-item active">角色管理</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    系统角色管理
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
                <h4 class="panel-title">系统角色列表</h4>
            </div>
            <!-- end panel-heading -->

            <!-- begin panel-body -->
            <div class="panel-body">
                <div class="table-responsive">
                <div class="dt-buttons btn-group p-b-15">
                    <a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-buttons"
                       data-href="{$myf_path}/admin/system/role/edit?method=add"
                       href="javascript:openModel('btnAddRole')"
                       data-title="添加角色"
                       id="btnAddRole"
                    ><span>添加角色</span></a>
                </div>

                <table id="data-table-buttons" class="table table-condensed table-hover myf-table-bordered myf-table-td-center">
                    <thead>
                        <tr>
                            <th width="2%" data-orderable="false">ID</th>
                            <th class="text-nowrap ">角色名称</th>
                            <th class="text-nowrap ">备注</th>
                            <th width="20%" class="text-nowrap ">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    {foreach from=$datas key=k item=vo}
                        <tr>
                            <td width="1%">{$vo.id}</td>
                            <td>
                                {$vo.name|escape:'html'}
                            </td>
                            <td>
                                {$vo.remark|escape:'html'}
                            </td>
                            <td class="">
                                <a title="角色下管理员" data-toggle="tooltip"  href="{$myf_path}/admin#!system/admin?role={$vo.id}" class="btn btn-info btn-icon btn-circle btn-sm">
                                    <i class="fas fa-th-list"></i>
                                </a>
                                {if $vo.id neq 1}
                                <a title="编辑角色"
                                   data-href="{$myf_path}/admin/system/role/edit?method=update&id={$vo.id}"
                                   href="javascript:openModel('btnEdit_{$vo.id}')"
                                   data-title="编辑角色"
                                   id="btnEdit_{$vo.id}" class="btn btn-warning btn-icon btn-circle btn-sm">
                                    <i class="fas fa-pencil-alt"></i>
                                </a>
                                <a href="javascript:FreeCms.deleteRow({$vo.id});" title="删除"  data-toggle="tooltip"
                                   class="btn btn-danger btn-icon btn-circle btn-sm"><i class="fa fa-times"></i>
                                </a>
                                {/if}
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
<input type="hidden" id="saveUrl" value="{$myf_path}/admin/system/role/save">
<input type="hidden" id="deleteUrl" value="{$myf_path}/admin/system/role/save">

<script type="text/javascript">
</script>

