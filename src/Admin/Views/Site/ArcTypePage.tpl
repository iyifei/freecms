<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">站点</li>
    <li class="breadcrumb-item active">栏目管理</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    栏目管理
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
                <h4 class="panel-title">网站栏目列表</h4>
            </div>
            <!-- end panel-heading -->

            <!-- begin panel-body -->
            <div class="panel-body">
                <div class="table-responsive">
                    <div class="dt-buttons btn-group p-b-15">
                        <a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-buttons" href="javascript:FreeCms.batchSave('sortrank');"><span>更新排序</span></a>
                        <a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-buttons"
                           href="#!site/arctype/edit?method=add"
                        ><span>添加顶级栏目</span></a>
                    </div>

                <table id="data-table-buttons" class="table table-condensed table-hover myf-table-bordered myf-table-td-center">
                    <thead>
                        <tr>
                            <th width="2%">排序</th>
                            <th width="2%" data-orderable="false">ID</th>
                            <th class="text-nowrap ">栏目名称</th>
                            <th width="15%" class="text-nowrap ">栏目模型</th>
                            <th width="15%" class="text-nowrap ">栏目类型</th>
                            <th width="20%" class="text-nowrap ">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <{foreach from=$datas item=vo}>
                        <tr>
                            <td width="1%" class="f-s-600 text-inverse">
                                <input class="left mr10 fm-text sortrank"
                                       autocomplete="off"
                                       style="margin-top: 0;width:30px;text-align: center"  onkeyup="if (isNaN(value)) execCommand('undo')"
                                       onafterpaste="if(isNaN(value))execCommand('undo')"
                                       name="sortrank_<{$vo.id}>" did="<{$vo.id}>" type="text"  value="<{$vo.sortrank}>">
                            </td>
                            <td width="1%"><{$vo.id}></td>
                            <td class="myf-td-left">
                                <{$vo.spacer}><{$vo.typename|escape:'html'}>(<{$vo.typedir|escape:'html'}>)
                            </td>
                            <td>
                                <{if $vo.channel eq 'image'}>
                                    <i class="far fa-images"></i>&nbsp;图集
                                <{elseif $vo.channel eq 'video'}>
                                    <i class="fab fa-youtube"></i>&nbsp;视频
                                <{elseif $vo.channel eq 'audio'}>
                                    <i class="fas fa-volume-down"></i>&nbsp;音频
                                <{else}>
                                    <i class="fas fa-file"></i>&nbsp;文章
                                <{/if}>
                            </td>
                            <td class="">
                                <{if $vo.type eq 'list'}>
                                    <i class="fas fa-list"></i>&nbsp;最终列表
                                <{elseif $vo.type eq 'face'}>
                                    <i class="fas fa-book"></i>&nbsp;封面栏目
                                <{elseif $vo.type eq 'link'}>
                                    <i class="fas fa-link"></i>&nbsp;外部连接
                                <{/if}>
                            </td>
                            <td class="">
                                <a title="栏目下文章" data-toggle="tooltip"  href="#" class="btn btn-info btn-icon btn-circle btn-sm">
                                    <i class="fas fa-th-list"></i>
                                </a>
                                <a title="预览" data-toggle="tooltip"  href="#" class="btn btn-green btn-icon btn-circle btn-sm">
                                    <i class="fab fa-html5"></i>
                                </a>
                                <a title="添加子栏目" data-toggle="tooltip"  href="#!site/arctype/edit?method=add&pid=<{$vo.id}>"  class="btn btn-primary btn-icon btn-circle btn-sm">
                                    <i class="fas fa-plus"></i>
                                </a>
                                <a title="编辑" data-toggle="tooltip"  href="#!site/arctype/edit?method=update&id=<{$vo.id}>" class="btn btn-warning btn-icon btn-circle btn-sm">
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
<input type="hidden" id="deleteUrl" value="<{$myf_path}>/admin/site/arctype/save">
<input type="hidden" id="saveUrl" value="<{$myf_path}>/admin/site/arctype/save">
<script type="text/javascript">
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
</script>

