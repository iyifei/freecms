<!-- begin #header -->
<div id="header" class="header navbar navbar-default navbar-fixed-top">
    <!-- begin container -->
    <div class="container">
        <!-- begin navbar-header -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="index.html" class="navbar-brand">
                <span class="navbar-logo"></span>
                <span class="brand-text">
                        Support Forum
                    </span>
            </a>
        </div>
        <!-- end navbar-header -->
        <!-- begin #header-navbar -->
        <div class="collapse navbar-collapse" id="header-navbar">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <form class="navbar-form">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="论坛主题关键字搜索" />
                            <button type="submit" class="btn btn-search"><i class="fa fa-search"></i></button>
                        </div>
                    </form>
                </li>
                {if empty($CurrentMember)}
                    <li><a href="javascript:;">注册账号</a></li>
                    <li><a href="{$myf_path}/member/login?go={$myf_path}/forum">登录</a></li>
                {else}
                    <li><a href="javascript:;">欢迎：{$CurrentMember.uname|default:$CurrentMember.userid}</a></li>
                {/if}
            </ul>
        </div>
        <!-- end #header-navbar -->
    </div>
    <!-- end container -->
</div>
<!-- end #header -->