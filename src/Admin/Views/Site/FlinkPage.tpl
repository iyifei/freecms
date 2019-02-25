<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">站点</li>
    <li class="breadcrumb-item active">友情链接</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    友情链接
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
                <h4 class="panel-title">网站友情链接列表</h4>
            </div>
            <!-- end panel-heading -->

            <!-- begin panel-body -->
            <div class="panel-body">
                <div class="table-responsive">
                    <div class="dt-buttons btn-group p-b-15">
                        <a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-buttons" href="javascript:FreeCms.batchSave('sortrank');"><span>更新排序</span></a>
                        <a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-buttons"
                           data-href="<{$myf_path}>/admin/site/flink/edit?method=add"
                           href="javascript:openModel('btnAddFlink')"
                           data-title="添加友情链接"
                           id="btnAddFlink"
                        ><span>添加友情链接</span></a>
                    </div>

                <table id="data-table-buttons" class="table table-condensed table-hover myf-table-bordered myf-table-td-center">
                    <thead>
                        <tr>
                            <th width="2%">排序</th>
                            <th class="text-nowrap ">网站名称</th>
                            <th width="12%" class="text-nowrap ">标志</th>
                            <th width="15%" class="text-nowrap ">网站logo</th>
                            <th width="12%" class="text-nowrap ">更新时间</th>
                            <th width="12%" class="text-nowrap ">备注</th>
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
                            <td>
                                <{$vo.webname|escape:'html'}>(<{$vo.url|escape:'html'}>)
                            </td>
                            <td>
                                <{if $vo.logo}>
                                    <a href="<{$ossDomain}>/<{$vo.logo}>" target="_blank" title="查看原图">
                                        <img src="<{$ossDomain}>/<{$vo.logo}>?thumbnail=w-100/h-80" id="imgLitpic" alt="缩略图预览" title="查看原图" style="height:30px;margin-right:10px;border:1px solid #ccc;padding:1px;" />
                                    </a>
                                <{else}>
                                    无图标
                                <{/if}>
                            </td>
                            <td>
                                <{$vo.subgroup|escape:'html'}>
                            </td>
                            <td>
                                <{$vo.dtime|date_format:"%Y-%m-%d"}>
                            </td>
                            <td>
                                <{$vo.remark|escape:'html'}>
                            </td>
                            <td>
                                <a title="预览" data-toggle="tooltip" target="_blank"  href="<{$vo.url}>" class="btn btn-green btn-icon btn-circle btn-sm">
                                    <i class="fab fa-html5"></i>
                                </a>
                                <a title="编辑"  data-toggle="tooltip"
                                   data-href="<{$myf_path}>/admin/site/flink/edit?method=update&id=<{$vo.id}>"
                                   href="javascript:openModel('btnEdit_<{$vo.id}>')"
                                   data-title="编辑友情链接"
                                   id="btnEdit_<{$vo.id}>" class="btn btn-warning btn-icon btn-circle btn-sm">
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
<input type="hidden" id="deleteUrl" value="<{$myf_path}>/admin/site/flink/save">
<input type="hidden" id="saveUrl" value="<{$myf_path}>/admin/site/flink/save">
<script type="text/javascript">
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
</script>

