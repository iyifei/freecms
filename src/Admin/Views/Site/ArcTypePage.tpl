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
                <table id="data-table-buttons" class="table table-condensed table-hover myf-table-bordered myf-table-td-vm">
                    <thead>
                        <tr>
                            <th width="2%">排序</th>
                            <th width="2%" data-orderable="false">ID</th>
                            <th class="text-nowrap tacenter">栏目名称</th>
                            <th width="15%" class="text-nowrap tacenter">栏目模型</th>
                            <th width="15%" class="text-nowrap tacenter">栏目类型</th>
                            <th width="20%" class="text-nowrap tacenter">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <{foreach from=$datas item=vo}>
                        <tr class="treegrid-<{$vo.id}> <{if $vo.pid neq 0}>treegrid-parent-<{$vo.pid}><{/if}>">
                            <td width="1%" class="f-s-600 text-inverse">
                                <input class="left mr10 fm-text sortrank"
                                       style="margin-top: 0;width:30px;text-align: center"  onkeyup="if (isNaN(value)) execCommand('undo')"
                                       onafterpaste="if(isNaN(value))execCommand('undo')"
                                       name="sortrank_<{$vo.id}>" did="<{$vo.id}>" type="text"  value="<{$vo.sortrank}>">
                            </td>
                            <td width="1%"><{$vo.id}></td>
                            <td>
                                <{$vo.spacer}><{$vo.typename|escape:'html'}>(<{$vo.typedir|escape:'html'}>)
                            </td>
                            <td class="tacenter">
                                <{if $vo.channel eq 'image'}>
                                    图集
                                <{elseif $vo.channel eq 'video'}>
                                    视频
                                <{elseif $vo.channel eq 'audio'}>
                                    音频
                                <{else}>
                                    文章
                                <{/if}>
                            </td>
                            <td class="tacenter">
                                <{if $vo.type eq 'list'}>
                                    最终列表
                                <{elseif $vo.type eq 'face'}>
                                    封面栏目
                                <{elseif $vo.type eq 'link'}>
                                    外部连接
                                <{/if}>
                            </td>
                            <td class="tacenter">
                                <a href="#" class="btn btn-info btn-icon btn-circle btn-sm">
                                    <i class="fas fa-th-list"></i>
                                </a>
                                <a href="#" class="btn btn-green btn-icon btn-circle btn-sm">
                                    <i class="fab fa-html5"></i>
                                </a>
                                <a href="#" class="btn btn-primary btn-icon btn-circle btn-sm">
                                    <i class="fas fa-plus"></i>
                                </a>
                                <a href="javascript:loadPage('btnEdit','sidebarSiteArcType');" id="btnEdit" data-url="<{$myf_path}>/admin/site/arctype/edit?method=update&id=<{$vo.id}>" class="btn btn-warning btn-icon btn-circle btn-sm">
                                    <i class="fas fa-pencil-alt"></i>
                                </a>
                                <a href="javascript:;" title="删除" class="btn btn-danger btn-icon btn-circle btn-sm"><i class="fa fa-times"></i></a>
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
<script type="text/javascript">
</script>

