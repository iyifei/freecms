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
        <h1>{$totalSubject}个讨论主题</h1>
        <div class="input-group m-b-20">
            <input type="text" class="form-control input-lg" placeholder="论坛搜索" />
            <span class="input-group-btn">
                    <button type="submit" class="btn btn-lg"><i class="fa fa-search"></i></button>
                </span>
        </div>
        <h5>热门讨论栏目</h5>
        <ul class="popular-tags">
            <li><a href="#"><i class="fa fa-circle text-danger"></i> CSS</a></li>
            <li><a href="#"><i class="fa fa-circle text-primary"></i> Bootstrap</a></li>
            <li><a href="#"><i class="fa fa-circle text-warning"></i> Javascript</a></li>
            <li><a href="#"><i class="fa fa-circle"></i> jQuery</a></li>
            <li><a href="#"><i class="fa fa-circle text-success"></i> Android</a></li>
            <li><a href="#"><i class="fa fa-circle text-muted"></i> iOS</a></li>
            <li><a href="#"><i class="fa fa-circle text-purple"></i> Template</a></li>
        </ul>
    </div>
    <!-- end container -->
</div>
<!-- end search-banner -->

<!-- begin content -->
<div class="content">
    <!-- begin container -->
    <div class="container">

        {foreach from=$columns item=childColumn}
        <!-- begin panel-forum -->
        <div class="panel panel-forum">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <h4 class="panel-title">{$childColumn.name}</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin forum-list -->
            <ul class="forum-list">
                {foreach from=$childColumn.children item=vo}
                <li>
                    <!-- begin media -->
                    <div class="media">
                        <img src="{$myf_path}/cloud/{$vo.icon}?thumbnail=h-90/w-90" alt="" />
                    </div>
                    <!-- end media -->
                    <!-- begin info-container -->
                    <div class="info-container">
                        <div class="info">
                            <h4 class="title"><a href="{$myf_path}/forum/category/{$vo.enId}.html">{$vo.name}</a></h4>
                            <p class="desc">
                                {$vo.description}
                            </p>
                        </div>
                        <div class="total-count">
                            <span class="total-post">{$vo.subjectCount}</span> <span class="divider">/</span> <span class="total-comment">{$vo.totalPosts}</span>
                        </div>
                        <div class="latest-post">
                            <h4 class="title"><a href="{$vo.lastSubject.linkurl}">{$vo.lastSubject.title}</a></h4>
                            <p class="time">{$vo.lastSubject.createTime} <a href="{$vo.lastSubject.createMember.profileurl}">{$vo.lastSubject.createMember.uname}</a> </p>
                        </div>
                    </div>
                    <!-- end info-container -->
                </li>
                {/foreach}
            </ul>
            <!-- end forum-list -->
        </div>
        <!-- end panel-forum -->
        {/foreach}
    </div>
    <!-- end container -->
</div>
<!-- end content -->


{include file="../Common/footer.tpl"}
</body>
</html>
