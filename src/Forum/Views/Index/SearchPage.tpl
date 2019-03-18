<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    {include file="../Common/head.tpl"}
</head>
<body>

{include file="../Common/top.tpl"}

<!-- begin search-banner -->
<div class="search-banner has-bg">
    <!-- begin bg-cover -->
    <div class="bg-cover">
        <img src="{$myf_path}/statics/public/img/cover/cover-1.jpg" alt="" />
    </div>
    <!-- end bg-cover -->
    <!-- begin container -->
    <div class="container">
        <h1>搜索</h1>
        <div class="input-group m-b-20">
            <input type="text" id="indexSearchBox" value="{$freecms.title}" class="form-control input-lg search" placeholder="论坛搜索" />
            <span class="input-group-btn">
                    <button type="button" onclick="search('indexSearchBox')" class="btn btn-lg"><i class="fa fa-search"></i></button>
                </span>
        </div>
    </div>
    <!-- end container -->
</div>
<!-- end search-banner -->

<!-- begin content -->
<div class="content">
    <!-- begin container -->
    <div class="container">
        <!-- begin row -->
        <div class="row">
            <!-- begin col-9 -->
            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-3">
                        <div class="text-left">
                            <a href="{$freecms.newsubjecturl}" class="btn btn-primary">撰写新帖</a>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <!-- begin pagination -->
                        <div class="text-right">
                            <ul class="pagination m-t-0 m-b-15">
                                {page pagesize="2"}
                            </ul>
                        </div>
                        <!-- end pagination -->
                    </div>
                </div>


                <!-- begin panel-forum -->
                <div class="panel panel-forum">
                    <!-- begin forum-list -->
                    <ul class="forum-list forum-topic-list">
                        {search pagesize="2" id="vo"}
                        <li>
                            <!-- begin media -->
                            <div class="media">
                                <img src="{$vo.createMember.avatarThumbUrl}">
                            </div>
                            <!-- end media -->
                            <!-- begin info-container -->
                            <div class="info-container">
                                <div class="info">
                                    <h4 class="title"><a href="{$myf_path}/forum/posts/{$vo.senid}.html">{$vo.title|escape:'html'}</a></h4>
                                    <ul class="info-start-end">
                                        <li>帖主： <a href="detail.html">{$vo.createMember.uname|escape:'html'}</a></li>
                                        <li>最新回帖：<a href="detail.html">{$vo.lastMember.uname|escape:'html'}</a></li>
                                    </ul>
                                </div>
                                <div class="date-replies">
                                    <div class="time">
                                        {$vo.lastTime}
                                    </div>
                                    <div class="replies">
                                        <div class="total">{$vo.replies}</div>
                                        <div class="text">回帖数</div>
                                    </div>
                                </div>
                            </div>
                            <!-- end info-container -->
                        </li>
                        {/search}
                    </ul>
                    <!-- end forum-list -->
                </div>
                <!-- end panel-forum -->

                <div class="row">
                    <div class="col-md-3">
                        <div class="text-left">
                            <a href="{$freecms.newsubjecturl}" class="btn btn-primary">撰写新帖</a>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <!-- begin pagination -->
                        <div class="text-right">
                            <ul class="pagination m-t-0 m-b-15">
                                {page pagesize="2"}
                            </ul>
                        </div>
                        <!-- end pagination -->
                    </div>
                </div>
            </div>
            <!-- end col-9 -->
            <!-- begin col-3 -->
            <div class="col-md-3">
                <!-- begin panel-forum -->
                <div class="panel panel-forum">
                    <div class="panel-heading">
                        <h4 class="panel-title">热门帖子</h4>
                    </div>
                    <!-- begin threads-list -->
                    <ul class="threads-list">
                        {subject id="arc" columnId="{$data.id}" limit="10" orderby="replies"}
                        <li>
                            <h4 class="title"><a href="{$arc.linkurl}">{$arc.title}</a></h4>
                            最后回帖 <a href="#">{$arc.lastMember.uname}</a> {$arc.lastTime}
                        </li>
                        {/subject}
                    </ul>
                    <!-- end threads-list -->
                </div>
                <!-- end panel-forum -->
            </div>
            <!-- end col-3 -->
        </div>
        <!-- end row -->
    </div>
    <!-- end container -->
</div>
<!-- end content -->

{include file="../Common/footer.tpl"}
</body>
</html>
