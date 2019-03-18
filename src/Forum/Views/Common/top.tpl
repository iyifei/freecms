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
            <a href="{$myf_path}/forum" class="navbar-brand">
                <span class="navbar-logo"></span>
                <span class="brand-text">
                        {$forum.title}
                    </span>
            </a>
        </div>
        <!-- end navbar-header -->
        <!-- begin #header-navbar -->
        <div class="collapse navbar-collapse" id="header-navbar">
            <ul class="nav navbar-nav navbar-right">
                <li>
                  <a href="{$myf_path}/" target="_blank">网站首页</a>
                </li>
                {if empty($CurrentMember)}
                    <li><a href="{$myf_path}/member/register?go={$myf_path}/forum">注册账号</a></li>
                    <li><a href="{$myf_path}/member/login?go={$myf_path}/forum">会员登录</a></li>
                {else}
                    <li><a href="{$myf_path}/member">欢迎：{$CurrentMember.uname|default:$CurrentMember.userid}</a></li>
                    <li><a href="{$myf_path}/member/quit">退出</a></li>
                {/if}
            </ul>
        </div>
        <!-- end #header-navbar -->
    </div>
    <!-- end container -->
</div>
<!-- end #header -->