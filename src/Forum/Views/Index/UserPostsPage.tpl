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
        <img src="{$myf_path}/statics/public/img/cover/cover-13.jpg" alt="" />
    </div>
    <!-- end bg-cover -->
    <!-- begin container -->
    <div class="container">
        <!-- begin breadcrumb -->
        {$freecms.position}
        <!-- end breadcrumb -->
        <h1>【{$freecms.uname}】用户参与回帖列表</h1>
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
                    <div class="col-md-12">
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
                        {subjectlist pagesize="2" id="vo"}
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
                                        {if $vo.createMemberId eq $CurrentMember.id || $CurrentAdmin.roleid eq 1}
                                        <li>
                                            <a class="btn btn-sm btn-danger" href="javascript:deleteRow('{$vo.senid}','subject');">删除</a>
                                        </li>
                                        {/if}
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
                        {/subjectlist}
                    </ul>
                    <!-- end forum-list -->
                </div>
                <!-- end panel-forum -->

                <div class="row">
                    <div class="col-md-12">
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
