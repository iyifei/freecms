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

<!-- begin page-title -->
<div class="page-title has-bg">
    <!-- begin bg-cover -->
    <div class="bg-cover">
        <img src="{$myf_path}/statics/public/img/cover/cover-2.jpg" alt="" />
    </div>
    <!-- end bg-cover -->
    <!-- begin container -->
    <div class="container">
        <!-- begin breadcrumb -->
        <ul class="breadcrumb">
            <li><a>{$data.parentColumn.name}</a></li>
            <li class="active">&nbsp;</li>
        </ul>
        <!-- end breadcrumb -->
        <h1>{$data.name}</h1>
    </div>
    <!-- end container -->
</div>
<!-- end page-title -->

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
                            <a href="{$myf_path}/forum/posts/new/{$data.cenid}.html" class="btn btn-primary">我有话要说，发新帖</a>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <!-- begin pagination -->
                        <div class="text-right">
                            <ul class="pagination m-t-0 m-b-15">
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li class="text"><span>...</span></li>
                                <li><a href="#">322</a></li>
                                <li class="right"><a href="#"><i class="fa fa-chevron-right"></i></a></li>
                            </ul>
                        </div>
                        <!-- end pagination -->
                    </div>
                </div>


                <!-- begin panel-forum -->
                <div class="panel panel-forum">
                    <!-- begin forum-list -->
                    <ul class="forum-list forum-topic-list">
                        {foreach from=$res.rows item=vo}
                        <li>
                            <!-- begin media -->
                            <div class="media">
                                <img src="{$myf_path}/cloud/{if !empty($vo.createMember.avatar)}{$vo.createMember.avatar}{else}images/default_avatar.png{/if}?thumbnail=h-90/w-90">
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
                        {/foreach}
                    </ul>
                    <!-- end forum-list -->
                </div>
                <!-- end panel-forum -->

                <div class="row">
                    <div class="col-md-3">
                        <div class="text-left">
                            <input type="button" class="btn btn-primary" value="我来发帖">
                        </div>
                    </div>
                    <div class="col-md-9">
                        <!-- begin pagination -->
                        <div class="text-right">
                            <ul class="pagination m-t-0 m-b-15">
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li class="text"><span>...</span></li>
                                <li><a href="#">322</a></li>
                                <li class="right"><a href="#"><i class="fa fa-chevron-right"></i></a></li>
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
                        <h4 class="panel-title">Active Threads</h4>
                    </div>
                    <!-- begin threads-list -->
                    <ul class="threads-list">
                        <li>
                            <h4 class="title"><a href="detail.html">Browser Local Storage Tutorial</a></h4>
                            last reply by <a href="#">Anatoliy</a> 1 minutes ago
                        </li>
                        <li>
                            <h4 class="title"><a href="detail.html">How to create live push notification with HTML5 web socket</a></h4>
                            last reply by <a href="#">Nasim</a> 8 minutes ago
                        </li>
                        <li>
                            <h4 class="title"><a href="detail.html">Help! How to fire an ajax call while bootstrap modal is loading.</a></h4>
                            last reply by <a href="#">Ural</a> 15 minutes ago
                        </li>
                        <li>
                            <h4 class="title"><a href="detail.html">Migrate from jQuery 1.9.x to 2.x.x</a></h4>
                            last reply by <a href="#">Arnold</a> 1 hour ago
                        </li>
                        <li>
                            <h4 class="title"><a href="detail.html">Angular JS IE8 compatibility issues</a></h4>
                            last reply by <a href="#">Mayeso</a> 4 hours ago
                        </li>
                        <li>
                            <h4 class="title"><a href="detail.html">How to use FontAwesome Cheatsheet?</a></h4>
                            last reply by <a href="#">Cepheus Herman</a> 1 day ago
                        </li>
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
