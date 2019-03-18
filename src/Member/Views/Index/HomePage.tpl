<ol class="breadcrumb pull-right">
    <li class="breadcrumb-item"><a href="javascript:;">会员</a></li>
    <li class="breadcrumb-item active">会员主页</li>
</ol>
<!-- end breadcrumb -->
<!-- begin page-header -->
<h1 class="page-header">会员主页</h1>
<!-- end page-header -->

<!-- begin row -->
<div class="row">
    <!-- begin col-3 -->
    <div class="col-lg-6 col-md-6">
        <div class="widget widget-stats bg-red">
            <div class="stats-icon"><i class="fa fa-desktop"></i></div>
            <div class="stats-info">
                <h4>我的文章</h4>
                <p>3,291,922</p>
            </div>
            <div class="stats-link">
                <a href="javascript:;">访问详情 <i class="fa fa-arrow-alt-circle-right"></i></a>
            </div>
        </div>
    </div>
    <!-- end col-3 -->
    <!-- begin col-3 -->
    <div class="col-lg-6 col-md-6">
        <div class="widget widget-stats bg-orange">
            <div class="stats-icon"><i class="fa fa-file-archive"></i></div>
            <div class="stats-info">
                <h4>我的主贴</h4>
                <p>20000</p>
            </div>
            <div class="stats-link">
                <a href="javascript:;">文章管理 <i class="fa fa-arrow-alt-circle-right"></i></a>
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
                <h4 class="panel-title">论坛新帖</h4>
            </div>
            <div id="schedule-calendar" class="bootstrap-calendar"></div>
            <div class="list-group">
                {foreach from=$subjects item=vo}
                <a target="_blank" href="{$vo.linkurl}" class="list-group-item d-flex justify-content-between align-items-center text-ellipsis">
                    {$vo.title}
                    <span class="badge f-w-500 bg-gradient-teal f-s-10">{$vo.createTime}</span>
                </a>
                {/foreach}
            </div>
        </div>
        <!-- end panel -->
    </div>
    <!-- end col-6 -->
    <!-- begin col-6 -->
    <div class="col-lg-6">
        <!-- begin panel -->
        <div class="panel panel-inverse" data-sortable-id="index-3">
            <div class="panel-heading">
                <h4 class="panel-title">最新文章</h4>
            </div>
            <div id="schedule-calendar" class="bootstrap-calendar"></div>
            <div class="list-group">
                {foreach from=$archives item=vo}
                    <a target="_blank" href="{$vo.linkurl}" class="list-group-item d-flex justify-content-between align-items-center text-ellipsis">
                        {$vo.title}
                        <span class="badge f-w-500 bg-gradient-teal f-s-10">{$vo.pubtime}</span>
                    </a>
                {/foreach}
            </div>
        </div>
        <!-- end panel -->
    </div>
    <!-- end col-6 -->
</div>
<!-- end row -->
