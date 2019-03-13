<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">站点</li>
    <li class="breadcrumb-item active">广告管理</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    广告管理
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
                <h4 class="panel-title">广告列表</h4>
            </div>
            <!-- end panel-heading -->

            <!-- begin panel-body -->
            <div class="panel-body">
                <div class="table-responsive">
                    <div class="dt-buttons btn-group p-b-15">
                        <a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-buttons"
                           data-href="{$myf_path}/admin/site/ad/edit?method=add"
                           href="javascript:openModel('btnAddAd')"
                           data-title="添加广告"
                           id="btnAddAd"
                        ><span>添加广告</span></a>
                    </div>

                <table id="data-table-buttons" class="table table-condensed table-hover myf-table-bordered myf-table-td-center">
                    <thead>
                        <tr>
                            <th width="2%" data-orderable="false">ID</th>
                            <th class="text-nowrap ">广告名称</th>
                            <th width="15%"  class="text-nowrap ">广告标识</th>
                            <th width="25%" class="text-nowrap ">有效期时间范围</th>
                            <th width="20%" class="text-nowrap ">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    {foreach from=$rows key=k item=vo}
                        <tr>
                            <td width="2%">{$vo.id}</td>
                            <td>
                                {$vo.name|escape:'html'}
                            </td>
                            <td>
                               {$vo.uuid}
                            </td>
                            <td>
                                {if $vo.timetype eq 0}
                                    无时间限制
                                {else}
                                    {$vo.starttime}~
                                    <br/>
                                    {$vo.endtime}
                                {/if}
                            </td>
                            <td>
                                <a title="代码"  data-toggle="tooltip"
                                   data-href="{$myf_path}/admin/site/ad/view?id={$vo.id}"
                                   href="javascript:openModel('btnCode_{$vo.id}')"
                                   data-title="广告位代码"
                                   id="btnCode_{$vo.id}" class="btn btn-primary btn-icon btn-circle btn-sm">
                                    <i class="fas fa-code"></i>
                                </a>
                                <a title="编辑"  data-toggle="tooltip"
                                   data-href="{$myf_path}/admin/site/ad/edit?method=update&id={$vo.id}"
                                   href="javascript:openModel('btnEdit_{$vo.id}')"
                                   data-title="编辑广告位"
                                   id="btnEdit_{$vo.id}" class="btn btn-warning btn-icon btn-circle btn-sm">
                                    <i class="fas fa-pencil-alt"></i>
                                </a>
                                <a title="删除" data-toggle="tooltip" href="javascript:FreeCms.deleteRow({$vo.id});" class="btn btn-danger btn-icon btn-circle btn-sm"><i class="fa fa-times"></i></a>
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
<input type="hidden" id="deleteUrl" value="{$myf_path}/admin/site/ad/save">
<input type="hidden" id="saveUrl" value="{$myf_path}/admin/site/ad/save">
<script type="text/javascript">
</script>

