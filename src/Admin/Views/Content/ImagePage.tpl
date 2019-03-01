<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">内容</li>
    <li class="breadcrumb-item active">图集管理</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    图集管理
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
                <h4 class="panel-title">网站图集列表</h4>
            </div>
            <!-- end panel-heading -->

            <!-- begin panel-body -->
            <div class="panel-body">

                <div class="row p-b-10">
                    <div class="col-sm">
                        <div class="dt-buttons btn-group p-b-15">
                            <a class="btn btn-default buttons-html5 btn-sm" tabindex="0"
                               aria-controls="data-table-buttons"
                               href="#!content/image/edit?method=add"
                            ><span>录入新图集</span></a>
                            <a class="btn btn-default buttons-html5 btn-sm" tabindex="0"
                               aria-controls="data-table-buttons"
                               href="javascript:FreeCms.batchDeleteRows();"><span>批量删除</span></a>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <select  class="form-control"  name="typeid" id="selTypeid">
                            <option value="0">请选择所属栏目...</option>
                            {foreach from=$res.arctypes item=vo}
                                <option value="{$vo.id}" {if $vo.id eq $res.search.typeid}selected="selected"{/if}>
                                    {$vo.spacer}{$vo.typename}
                                </option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <input type="search"
                               autocomplete="off"
                               id="searchTitle"
                               name="title"
                               class="form-control input-sm"
                               placeholder="图集标题"
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
                            <th width="10%" class="text-nowrap ">缩略图</th>
                            <th class="text-nowrap ">文章标题</th>
                            <th width="15%" class="text-nowrap ">栏目</th>
                            <th width="15%" class="text-nowrap ">发布时间</th>
                            <th width="10%" class="text-nowrap ">浏览</th>
                            <th width="20%" class="text-nowrap ">操作</th>
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
                                    <img src="{$myf_path}/cloud/{$vo.litpic}?thumbnail=h-90" style="max-height: 50px;max-width: 150px;" />
                                </td>
                                <td class="myf-td-left">
                                    {$vo.title|escape:'html'} &nbsp; <span class="text-red">{$vo.flagname}</span>
                                </td>
                                <td><a href="#!content/article?typeid={$vo.typeid}"
                                       title="查看该栏目下的文章">{$vo.arctype.typename|escape:'html'}</a></td>
                                <td>
                                    {$vo.dtime|date_format:"%Y-%m-%d"}
                                </td>
                                <td>
                                    {$vo.click}
                                </td>
                                <td class="">
                                    <a title="预览" target="_blank" data-toggle="tooltip" href="{$myf_path}/archives/{$vo.enId}.html"
                                       class="btn btn-green btn-icon btn-circle btn-sm">
                                        <i class="fab fa-html5"></i>
                                    </a>
                                    <a title="编辑" data-toggle="tooltip"
                                       href="#!content/image/edit?method=update&id={$vo.id}"
                                       class="btn btn-warning btn-icon btn-circle btn-sm">
                                        <i class="fas fa-pencil-alt"></i>
                                    </a>
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
<input type="hidden" id="deleteUrl" value="{$myf_path}/admin/image/article/save">
<input type="hidden" id="saveUrl" value="{$myf_path}/admin/image/article/save">
<script type="text/javascript">
    $(function () {
        $("#search-btn").click(function () {
            var typeid = $("#selTypeid").val();
            var title = $("#searchTitle").val();
            var hash = '#!content/image?typeid='+typeid+"&title="+title;
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

