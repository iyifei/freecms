<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">站点</li>
    <li class="breadcrumb-item active">单页管理</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    单页管理
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
                <h4 class="panel-title">网站单页列表</h4>
            </div>
            <!-- end panel-heading -->

            <!-- begin panel-body -->
            <div class="panel-body">
                <div class="table-responsive">
                    <div class="dt-buttons btn-group p-b-15">
                        <a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-buttons" href="javascript:FreeCms.batchSave('sortrank');"><span>更新排序</span></a>
                        <a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-buttons"
                           href="#!site/page/edit?method=add"
                        ><span>添加单页</span></a>
                    </div>

                <table id="data-table-buttons" class="table table-condensed table-hover myf-table-bordered myf-table-td-center">
                    <thead>
                        <tr>
                            <th width="2%">排序</th>
                            <th width="2%" data-orderable="false">ID</th>
                            <th class="text-nowrap ">文章标题</th>
                            <th width="15%" class="text-nowrap ">相对地址</th>
                            <th width="12%" class="text-nowrap ">标志</th>
                            <th width="12%" class="text-nowrap ">更新时间</th>
                            <th width="20%" class="text-nowrap ">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <{foreach from=$datas key=k item=vo}>
                        <tr>
                            <td width="1%" class="f-s-600 text-inverse">
                                <input class="left mr10 fm-text sortrank"
                                       autocomplete="off"
                                       tabindex="<{$k+50}>"
                                       style="margin-top: 0;width:30px;text-align: center"  onkeyup="if (isNaN(value)) execCommand('undo')"
                                       onafterpaste="if(isNaN(value))execCommand('undo')"
                                       name="sortrank_<{$vo.id}>" did="<{$vo.id}>" type="text"  value="<{$vo.sortrank}>">
                            </td>
                            <td width="1%"><{$vo.id}></td>
                            <td>
                                <{$vo.title|escape:'html'}>
                            </td>
                            <td>
                                /pages/<{$vo.filename|escape:'html'}>.html
                            </td>
                            <td>
                                <{$vo.subgroup|escape:'html'}>
                            </td>
                            <td>
                                <{$vo.uptime|date_format:"%Y-%m-%d"}>
                            </td>
                            <td>
                                <a title="预览" data-toggle="tooltip" target="_blank"  href="<{$myf_path}>/pages/<{$vo.filename|escape:'html'}>.html" class="btn btn-green btn-icon btn-circle btn-sm">
                                    <i class="fab fa-html5"></i>
                                </a>
                                <a title="编辑" data-toggle="tooltip"  href="#!site/page/edit?method=update&id=<{$vo.id}>" class="btn btn-warning btn-icon btn-circle btn-sm">
                                    <i class="fas fa-pencil-alt"></i>
                                </a>
                                <a title="删除" data-toggle="tooltip" href="javascript:FreeCms.deleteRow(<{$vo.id}>);" class="btn btn-danger btn-icon btn-circle btn-sm"><i class="fa fa-times"></i></a>
                            </td>
                        </tr>
                    <{/foreach}>
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
<input type="hidden" id="deleteUrl" value="<{$myf_path}>/admin/site/page/save">
<input type="hidden" id="saveUrl" value="<{$myf_path}>/admin/site/page/save">
<script type="text/javascript">
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
</script>

