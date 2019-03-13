<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item"><a href="javascript:;">后台</a></li>
    <li class="breadcrumb-item active">系统主页</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">系统主页 <small>网站部分统计信息</small></h1>
<!-- end page-header -->

<!-- begin row -->
<div class="row">

    <!-- begin col-3 -->
    <div class="col-lg-3 col-md-6">
        <div class="widget widget-stats bg-orange">
            <div class="stats-icon"><i class="fa fa-file-archive"></i></div>
            <div class="stats-info">
                <h4>文章总数</h4>
                <p>{$data.totalCount}</p>
            </div>
            <div class="stats-link">
                <a href="{$myf_path}/admin#!content/article">文章管理 <i class="fa fa-arrow-alt-circle-right"></i></a>
            </div>
        </div>
    </div>
    <!-- end col-3 -->
    <!-- begin col-3 -->
    <div class="col-lg-3 col-md-6">
        <div class="widget widget-stats bg-grey-darker">
            <div class="stats-icon"><i class="fa fa-bullhorn"></i></div>
            <div class="stats-info">
                <h4>论坛帖子数量</h4>
                <p>xxx</p>
            </div>
            <div class="stats-link">
                <a href="javascript:;">帖子管理 <i class="fa fa-arrow-alt-circle-right"></i></a>
            </div>
        </div>
    </div>
    <!-- end col-3 -->
    <!-- begin col-3 -->
    <div class="col-lg-3 col-md-6">
        <div class="widget widget-stats bg-black-lighter">
            <div class="stats-icon"><i class="fa fa-comments"></i></div>
            <div class="stats-info">
                <h4>文章评论数</h4>
                <p>{$data.feedbackCount}</p>
            </div>
            <div class="stats-link">
                <a href="{$myf_path}/admin#!site/feedback">评论管理 <i class="fa fa-arrow-alt-circle-right"></i></a>
            </div>
        </div>
    </div>
    <!-- end col-3 -->
    <!-- begin col-3 -->
    <div class="col-lg-3 col-md-6">
        <div class="widget widget-stats bg-red">
            <div class="stats-icon"><i class="fa fa-desktop"></i></div>
            <div class="stats-info">
                <h4>文章浏览数</h4>
                <p>{$data.viewClick}</p>
            </div>
            <div class="stats-link">
                <a href="javascript:;">&nbsp;</a>
            </div>
        </div>
    </div>
    <!-- end col-3 -->
</div>
<!-- end row -->

<!-- begin row -->
<div class="row">
    <!-- begin col-6 -->
    <div class="col-lg-6">
        <!-- begin panel -->
        <div class="panel panel-inverse" data-sortable-id="index-3">
            <div class="panel-heading">
                <h4 class="panel-title">系统健康状态</h4>
            </div>
            <div id="schedule-calendar" class="bootstrap-calendar"></div>
            <div class="list-group">
                <div class="list-group-item d-flex justify-content-between align-items-center text-ellipsis">
                    磁盘总大小：<span class="badge f-w-500 bg-gradient-grey f-s-10">{$data.totalSize}</span>
                </div>
                <div  class="list-group-item d-flex justify-content-between align-items-center text-ellipsis">
                    可用磁盘空间：
                    <span class="badge f-w-500 bg-gradient-green f-s-10">{$data.freeSize}</span>
                </div>
                <div class="list-group-item d-flex justify-content-between align-items-center text-ellipsis">
                    临时日志文件占用空间：
                    <span>{$data.logPath}</span>
                    <a class="btn btn-sm btn-danger" href="javascript:;">清理</a>
                    <span class="badge f-w-500 bg-gradient-blue f-s-10">{$data.logPathSize}</span>
                </div>
                <div  class="list-group-item d-flex justify-content-between align-items-center text-ellipsis">
                    上传文件占用空间：
                    <span>{$data.uploadPath}</span>
                    <span class="badge f-w-500 bg-gradient-blue f-s-10">{$data.uploadPathSize}</span>
                </div>
                <div  class="list-group-item d-flex justify-content-between align-items-center text-ellipsis">
                    MySQL数据库内容占用大小：
                    <span class="badge f-w-500 bg-gradient-blue f-s-10">{$data.mysqlSize}</span>
                </div>
            </div>
        </div>
        <!-- end panel -->
    </div>
    <!-- end col-6 -->
    <!-- begin col-6 -->
    <div class="col-lg-6">
        <!-- begin panel -->
        <div class="panel panel-inverse" data-sortable-id="index-4">
            <div class="panel-heading">
                <h4 class="panel-title">会员总数 <span class="pull-right label bg-gradient-teal">{$data.memberCount}</span></h4>
            </div>
            <ul class="registered-users-list clearfix">
                {foreach from=$data.members item=vo}
                <li>
                    <a href="javascript:;">
                        <img src="{$myf_path}/cloud/{if !empty($vo.avatar)}{$vo.avatar}{else}images/default_avatar.png{/if}?thumbnail=h-90/w-90">
                    </a>
                    <h4 class="username text-ellipsis">
                        {$vo.userid}
                        <small>{$vo.uname}</small>
                    </h4>
                </li>
                {/foreach}
            </ul>
            <div class="panel-footer text-center">
                <a href="{$myf_path}/admin#!member/member" class="text-inverse">所有会员</a>
            </div>
        </div>
        <!-- end panel -->
    </div>
    <!-- end col-6 -->
</div>
<!-- end row -->