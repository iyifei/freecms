<!-- begin breadcrumb -->
<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item">后台</li>
    <li class="breadcrumb-item">系统</li>
    <li class="breadcrumb-item active">登陆日志</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">
    登陆日志
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
                <h4 class="panel-title">登陆日志</h4>
            </div>
            <!-- end panel-heading -->

            <!-- begin panel-body -->
            <div class="panel-body">

                <div class="row p-b-10">
                    <div class="col-sm-4">
                        <div class="input-group input-daterange" data-date-format="yyyy-mm-dd">
                            <input type="text" value="{$res.search.start}" autocomplete="off" class="form-control" id="txtStartDate" name="start" placeholder="开始日期">
                            <span class="input-group-addon">to</span>
                            <input type="text" value="{$res.search.end}" autocomplete="off"  class="form-control" id="txtEndDate" name="end" placeholder="结束日期">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <input type="search"
                               autocomplete="off"
                               id="searchUsername"
                               name="username"
                               class="form-control input-sm"
                               placeholder="登录名"
                               value="{$res.search.username}"
                               aria-controls="data-table-buttons">
                    </div>
                    <div class="col-sm-1">
                        <input type="button" id="search-btn" class="btn btn-default" value="搜索">
                    </div>
                    <div class="col-md"></div>
                </div>

                <div class="table-responsive">

                    <table id="data-table-buttons"
                           class="table table-condensed table-hover myf-table-bordered myf-table-td-center">
                        <thead>
                        <tr>
                            <th width="2%" data-orderable="false">#</th>
                            <th class="text-nowrap ">登录名</th>
                            <th width="15%" class="text-nowrap ">用户类型</th>
                            <th width="15%" class="text-nowrap ">用户ID</th>
                            <th width="10%" class="text-nowrap ">登录IP</th>
                            <th width="10%" class="text-nowrap ">所在城市</th>
                            <th width="20%" class="text-nowrap ">登录时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        {foreach from=$res.rows item=vo}
                            <tr>
                                <td>
                                    {$vo.id}
                                </td>
                                <td>
                                    {$vo.username}
                                </td>
                                <td>
                                    {if $vo.type eq 1}
                                        管理员
                                    {else}
                                        会员
                                    {/if}
                                </td>
                                <td>
                                    {$vo.uid}
                                </td>
                                <td>
                                    {$vo.ip}
                                </td>
                                <td>
                                    {$vo.city}
                                </td>
                                <td>
                                    {$vo.create_time}
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

<script type="text/javascript">
    $(function () {

        $("#search-btn").click(function () {
            var start = $("#txtStartDate").val();
            var end = $("#txtEndDate").val();
            var username = $("#searchUsername").val();
            var hash = '#!system/logs?start='+start+"&end="+end+"&username="+username;
            window.location.hash = hash;
        });

        $("#searchTitle").keydown(function(event){
            if(event.keyCode==13){
                $("#search-btn").click();
            }
        });

        $('.input-daterange').datepicker({
            language:"zh-CN"
        });
    })
</script>

