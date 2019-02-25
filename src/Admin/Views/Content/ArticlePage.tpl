
<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">内容</li>
    <li class="breadcrumb-item active">文章管理</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    文章管理
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
                <h4 class="panel-title">网站文章列表</h4>
            </div>
            <!-- end panel-heading -->

            <!-- begin panel-body -->
            <div class="panel-body">
                <div class="dt-buttons btn-group p-b-15">
                    <a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-buttons"
                       href="#!content/article/edit?method=add"
                    ><span>录入新文章</span></a>
                    <a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-buttons" href="javascript:FreeCms.batchSave('sortrank');"><span>批量删除</span></a>
                </div>

                <div class="table-responsive">

                    <table id="data-table-buttons" class="table table-condensed table-hover myf-table-bordered myf-table-td-center">
                    <thead>
                        <tr>
                            <th width="2%" data-orderable="false">ID</th>
                            <th width="2%" data-orderable="false">
                                <input type="checkbox" id="chkAll"/>
                            </th>
                            <th class="text-nowrap ">文章标题</th>
                            <th width="15%" class="text-nowrap ">栏目</th>
                            <th width="15%" class="text-nowrap ">发布时间</th>
                            <th width="10%" class="text-nowrap ">点击</th>
                            <th width="20%" class="text-nowrap ">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <{foreach from=$res.rows item=vo}>
                        <tr>
                            <td>
                                <{$vo.id}>
                            </td>
                            <td>
                                <input type="checkbox" id="chkId<{$vo.id}>" class="chkid" name="arcid[]" value="<{$vo.id}>">
                            </td>
                            <td>
                                <{$vo.title|escape:'html'}> &nbsp; <span class="text-red"><{$vo.flagname}></span>
                            </td>
                            <td><a href="<{$myf_path}>/admin/content/article?typeid=<{$vo.typeid}>" title="查看该栏目下的文章"><{$vo.arctype.typename|escape:'html'}></a></td>
                            <td>
                                <{$vo.dtime|date_format:"%Y-%m-%d"}>
                            </td>
                            <td>
                                <{$vo.click}>
                            </td>
                            <td class="">
                                <a title="预览" data-toggle="tooltip"  href="#" class="btn btn-green btn-icon btn-circle btn-sm">
                                    <i class="fab fa-html5"></i>
                                </a>
                                <a title="编辑" data-toggle="tooltip"  href="#!content/article/edit?method=update&id=<{$vo.id}>" class="btn btn-warning btn-icon btn-circle btn-sm">
                                    <i class="fas fa-pencil-alt"></i>
                                </a>
                                <a title="删除" data-toggle="tooltip" href="javascript:FreeCms.deleteRow(<{$vo.id}>);" class="btn btn-danger btn-icon btn-circle btn-sm"><i class="fa fa-times"></i></a>
                            </td>
                        </tr>
                    <{/foreach}>
                    </tbody>
                </table>

                </div>
                <div class="dataTables_paginate paging_simple_numbers" id="data-table-default_paginate">
                    <ul class="pagination">
                        <{$res.paging}>
                    </ul>
                </div>
            </div>
            <!-- end panel-body -->
        </div>
        <!-- end panel -->
    </div>
    <!-- end col-10 -->
</div>

<!-- end row -->
<input type="hidden" id="deleteUrl" value="<{$myf_path}>/admin/content/article/save">
<input type="hidden" id="saveUrl" value="<{$myf_path}>/admin/content/article/save">
<script type="text/javascript">
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
</script>

