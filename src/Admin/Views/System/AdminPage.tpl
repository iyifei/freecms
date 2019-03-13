<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">系统</li>
    <li class="breadcrumb-item active">管理员管理</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    系统管理员管理
    {if !empty($role)}
    <small>【{$role.name}】角色下的管理列表</small>
    {/if}
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
                <h4 class="panel-title">系统管理员列表</h4>
            </div>
            <!-- end panel-heading -->

            <!-- begin panel-body -->
            <div class="panel-body">
                <div class="table-responsive">
                <div class="dt-buttons btn-group p-b-15">
                    <a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-buttons"
                       data-href="{$myf_path}/admin/system/admin/edit?method=add"
                       href="javascript:openModel('btnAddAdmin')"
                       data-title="添加菜单"
                       id="btnAddAdmin"
                    ><span>添加管理员</span></a>
                </div>

                <table id="data-table-buttons" class="table table-condensed table-hover myf-table-bordered myf-table-td-center">
                    <thead>
                        <tr>
                            <th width="2%" data-orderable="false">ID</th>
                            <th width="10%" class="text-nowrap ">头像</th>
                            <th class="text-nowrap ">登录名</th>
                            <th class="text-nowrap ">真实姓名</th>
                            <th class="text-nowrap ">邮箱</th>
                            <th class="text-nowrap ">角色名称</th>
                            <th class="text-nowrap ">登录信息</th>
                            <th width="20%" class="text-nowrap ">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    {foreach from=$datas key=k item=vo}
                        <tr>
                            <td width="1%">{$vo.id}</td>
                            <td>
                                <img src="{$myf_path}/cloud/{if !empty($vo.avatar)}{$vo.avatar}{else}images/default_avatar.png{/if}?thumbnail=h-90" style="height:50px;">
                            </td>
                            <td>
                                {$vo.userid|escape:'html'}
                            </td>
                            <td>
                                {$vo.rname|escape:'html'}
                            </td>
                            <td>
                                {$vo.email|escape:'html'}
                            </td>
                            <td>
                                <a href="{$myf_path}/admin#!system/admin?role={$vo.role.id}" title="查看角色的管理员">{$vo.role.name|escape:'html'}</a>
                            </td>
                            <td>
                                IP:{if !empty($vo.loginip)}<a title="查询IP地址" href="https://www.ip.cn/index.php?ip={$vo.loginip}" target="_blank"> {$vo.loginip}</a>{/if}<br/>
                                时间:{$vo.logintime}
                            </td>
                            <td class="">
                                <a title="编辑管理员"  data-toggle="tooltip"
                                   data-href="{$myf_path}/admin/system/admin/edit?method=update&id={$vo.id}"
                                   href="javascript:openModel('btnEdit_{$vo.id}')"
                                   data-title="编辑管理员"
                                   id="btnEdit_{$vo.id}" class="btn btn-warning btn-icon btn-circle btn-sm">
                                    <i class="fas fa-pencil-alt"></i>
                                </a>
                                {if $vo.id neq 1}
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
<input type="hidden" id="saveUrl" value="{$myf_path}/admin/system/admin/save">
<input type="hidden" id="deleteUrl" value="{$myf_path}/admin/system/admin/save">

<script type="text/javascript">
</script>

