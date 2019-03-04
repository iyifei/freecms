<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">站点</li>
    <li class="breadcrumb-item active">评论管理</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    评论管理
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
                <h4 class="panel-title">文档评论列表</h4>
            </div>
            <!-- end panel-heading -->

            <!-- begin panel-body -->
            <div class="panel-body">

                <div class="row p-b-10">
                    <div class="col-sm">
                        <div class="dt-buttons btn-group p-b-15">
                            <a class="btn btn-default buttons-html5 btn-sm" tabindex="0"
                               aria-controls="data-table-buttons"
                               href="javascript:FreeCms.batchDeleteRows();"><span>批量删除</span></a>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <input type="search"
                               autocomplete="off"
                               id="searchTitle"
                               name="title"
                               class="form-control input-sm"
                               placeholder="文章标题"
                               value="{$res.search.title}"
                               aria-controls="data-table-buttons">
                    </div>
                    <div class="col-sm-1">
                        <input type="button" id="search-btn" class="btn btn-default" value="搜索">
                    </div>
                </div>

                <div class="table-responsive">

                    <table id="data-table-buttons"
                           class="table table-condensed table-hover myf-table-bordered myf-table-td-center">
                        <thead>
                        <tr>
                            <th width="2%" data-orderable="false">ID</th>
                            <th width="2%" data-orderable="false">
                                <input type="checkbox" id="chkAll"/>
                            </th>
                            <th class="text-nowrap ">文章标题</th>
                            <th class="text-nowrap ">评论内容</th>
                            <th width="10%" class="text-nowrap ">状态</th>
                            <th width="15%" class="text-nowrap ">评论人</th>
                            <th width="15%" class="text-nowrap ">评论时间</th>
                            <th width="10%" class="text-nowrap ">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        {foreach from=$res.rows item=vo}
                            <tr>
                                <td>
                                    {$vo.id}
                                </td>
                                <td>
                                    <input type="checkbox" id="chkId{$vo.id}" class="chkid" name="arcid[]"
                                           value="{$vo.id}">
                                </td>
                                <td>
                                    <a href="{$myf_path}/archives/{$vo.arcEnId}.html" target="_blank"
                                       title="预览文章内容">{$vo.atitle|escape:'html'}</a>
                                </td>
                                <td>
                                    {$vo.content|escape:'html'}
                                </td>
                                <td>
                                    {if $vo.ischeck eq 1}
                                        <span class="text-green">显示</span>
                                    {else}
                                        <span class="text-red">隐藏</span>
                                    {/if}
                                </td>
                                <td>
                                    {$vo.muserid|escape:'html'}{if !empty($vo.uname)}({$vo.uname}){/if}<br/>
                                    IP:<a title="查询IP地址" href="https://www.ip.cn/index.php?ip={$vo.ip}" target="_blank">{$vo.ip}</a>
                                </td>
                                <td>
                                    {$vo.dtime}
                                </td>

                                <td class="">
                                    <a title="删除" data-toggle="tooltip" href="javascript:FreeCms.deleteRow({$vo.id});"
                                       class="btn btn-danger btn-icon btn-circle btn-sm"><i class="fa fa-times"></i></a>
                                </td>
                            </tr>
                            {/foreach}
                        </tbody>
                    </table>
                    <ul class="pagination">
                        {$res.paging}
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
<input type="hidden" id="deleteUrl" value="{$myf_path}/admin/site/feedback/save">
<input type="hidden" id="saveUrl" value="{$myf_path}/admin/site/feedback/save">
<script type="text/javascript">
    $(function () {

        $("#search-btn").click(function () {
            var title = $("#searchTitle").val();
            var hash = '#!site/feedback?&title='+title;
            window.location.hash = hash;
        });

        $("#searchTitle").keydown(function(event){
            if(event.keyCode==13){
                $("#search-btn").click();
            }
        });

        $("#chkAll").click(function() {
            var checked = $(this).is(':checked');
            $(".chkid").prop("checked", checked);
        });
    })
</script>

