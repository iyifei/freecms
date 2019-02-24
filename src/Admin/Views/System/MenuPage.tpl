<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">系统</li>
    <li class="breadcrumb-item active">系统菜单</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    后台菜单管理
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
                <h4 class="panel-title">系统菜单列表</h4>
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
                            <th class="text-nowrap tacenter">菜单名称</th>
                            <th width="15%" class="text-nowrap tacenter">是否隐藏</th>
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
                                <{$vo.spacer}><{$vo.name|escape:'html'}>(<{$vo.url|escape:'html'}>)
                            </td>
                            <td class="tacenter">
                                <{if $vo.ishide eq 1}>
                                    <span class="text-red">隐藏</span>
                                <{else}>
                                    <span class="text-green">显示</span>
                                <{/if}>
                            </td>
                            <td class="tacenter">
                                <a href="#" class="btn btn-primary btn-icon btn-circle btn-sm">
                                    <i class="fas fa-plus"></i>
                                </a>
                                <a data-href="<{$myf_path}>/admin/system/menu/edit?method=update&id=<{$vo.id}>"
                                   href="javascript:openModel('btnEdit_<{$vo.id}>')"
                                   data-title="编辑菜单"
                                   id="btnEdit_<{$vo.id}>" class="btn btn-warning btn-icon btn-circle btn-sm">
                                    <i class="fas fa-pencil-alt"></i>
                                </a>
                                <a href="#!" id="btnShow" data-url="<{$myf_path}>/admin/site/arctype/edit?method=update&id=<{$vo.id}>" class="btn btn-warning btn-icon btn-circle btn-sm">
                                    <i class="fas fa-eye"></i>
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

<div class="modal fade" id="myModal"  tabindex="-1" style="display: none">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Modal Dialog</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body p-30">
                <iframe id="modelIframe" type="text/html" width="100%" height="460" src="" frameborder="0" allowfullscreen=""></iframe>
            </div>
            <div class="modal-footer">
                <a href="javascript:;" class="btn btn-white" data-dismiss="modal">关闭</a>
                <a href="javascript:doSubmit();" class="btn btn-success">保存</a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function openModel(id) {
        var src = $("#"+id).attr('data-href');
        var title = $("#"+id).data("title");
        $('#myModal .modal-title').html(title);
        $('#myModal').modal('show');
        $('#myModal iframe').attr('src', src);
    }

    //提交数据
    function doSubmit() {
        var subWin = window.frames['modelIframe'].contentWindow;
        if(typeof(subWin.submitForm)==='function'){
            subWin.submitForm();
        }
    }
    
    //关闭
    function doCloseModelAndRefresh() {
        FreeCms.success('更新成功');
        $('#myModal').modal('hide').on('hidden.bs.modal', function (e) {
            window.location.hash='#!system/menu?'+Date.parse(new Date());
        })
    }
    
</script>

