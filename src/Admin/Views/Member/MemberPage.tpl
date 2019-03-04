<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">会员</li>
    <li class="breadcrumb-item active">会员管理</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    会员管理
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
                <h4 class="panel-title">网站会员列表</h4>
            </div>
            <!-- end panel-heading -->

            <!-- begin panel-body -->
            <div class="panel-body">

                <div class="row p-b-10">
                    <div class="col-sm">
                        <div class="dt-buttons btn-group p-b-15">
                            <a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-buttons"
                               data-href="{$myf_path}/admin/member/member/edit?method=add"
                               href="javascript:openModel('btnAddMember')"
                               data-title="添加会员"
                               id="btnAddMember"
                            ><span>添加顶级菜单</span></a>
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
                               placeholder="会员登录名/邮箱"
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
                            <th width="10%" class="text-nowrap ">头像</th>
                            <th class="text-nowrap ">登录名(昵称)</th>
                            <th width="10%" class="text-nowrap ">状态</th>
                            <th width="10%" class="text-nowrap ">邮箱</th>
                            <th width="15%" class="text-nowrap ">注册信息</th>
                            <th width="15%" class="text-nowrap ">登录信息</th>
                            <th width="15%" class="text-nowrap ">操作</th>
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
                                    <img src="{$myf_path}/cloud/{if !empty($vo.avatar)}{$vo.avatar}{else}images/default_avatar.png{/if}?thumbnail=h-90" style="height:50px;">
                                </td>
                                <td>
                                    {$vo.userid|escape:'html'}
                                    {if !empty($vo.uname)}
                                        ({$vo.uname|escape:'html'})
                                    {/if}
                                </td>
                                <td>
                                    {if $vo.frozen eq 1}
                                        <span class="text-red">冻结</span>
                                    {else}
                                        <span class="text-green">正常</span>
                                    {/if}
                                </td>
                                <td>
                                    {$vo.email|escape:'html'}
                                </td>
                                <td>
                                    IP：{if !empty($vo.joinip)}<a title="查询IP地址" href="https://www.ip.cn/index.php?ip={$vo.joinip}" target="_blank"> {$vo.joinip}</a>{/if}<br/>
                                    时间：{$vo.jointime}
                                </td>
                                <td>
                                    IP：{if !empty($vo.loginip)}<a title="查询IP地址" href="https://www.ip.cn/index.php?ip={$vo.loginip}" target="_blank"> {$vo.loginip}</a>{/if}<br/>
                                    时间：{$vo.logintime}
                                </td>
                                <td class="">
                                    <a title="编辑"  data-toggle="tooltip"
                                       data-href="{$myf_path}/admin/member/member/edit?method=update&id={$vo.id}"
                                       href="javascript:openModel('btnEdit_{$vo.id}')"
                                       data-title="编辑会员"
                                       id="btnEdit_{$vo.id}" class="btn btn-warning btn-icon btn-circle btn-sm">
                                        <i class="fas fa-pencil-alt"></i>
                                    </a>
                                    <a title="冻结/解冻"  data-toggle="tooltip"
                                       href="javascript:FreeCms.oneSave({$vo.id},'frozen',{if $vo.frozen eq 1}0{else}1{/if})" id="btnShow" class="btn btn-warning btn-icon btn-circle btn-sm">
                                        {if $vo.frozen eq 1}
                                            <i class="fas fa-lock-open"></i>
                                        {else}
                                            <i class="fas fa-lock"></i>
                                        {/if}
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
<input type="hidden" id="deleteUrl" value="{$myf_path}/admin/member/member/save">
<input type="hidden" id="saveUrl" value="{$myf_path}/admin/member/member/save">
<script type="text/javascript">
    $(function () {

        $("#search-btn").click(function () {
            var title = $("#searchTitle").val();
            var hash = '#!member/member?title='+title;
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

