<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="chrome=1">
		<title>{global name="cfg_webname"}</title>
		<meta name="description" content="{global name='cfg_description'}" />
		<meta name="keywords" content="{global name='cfg_keywords'}" />
		<link rel="shortcut icon" href="/favicon.ico" />
		<link href="{$myf_theme_path}/public/css/sjb.css" rel="stylesheet" />
	</head>

	<body>
		<div id="topbar">
			<div class="mainwidth clearfix">
				<div id="slogan" class="clearfix">
					{global name="user_cfg_slogan"}
				</div>

				<div id="weather">

				</div>
			</div>
		</div>
		<div id="header" class="clearfix">
			<div class="logo">
				<a href="{$myf_path}/"> <img src="{$myf_theme_path}/public/images/logo.jpg" width="150" height="60" title="{global name="cfg_webname"}" /> </a>
			</div>
			<div class="search">
				<div class="clearfix">
					<form action="{$myf_path}/index.php" id="searchForm">
						<input type="hidden" name="c" value="search" />
						<input type="text" class="txt-search" id="txtSearchKeyword" placeholder="搜索新闻" name="a" />
						<a href="javascript:void(0)" class="btn-search" id="btnSearch">搜索</a>
					</form>
				</div>
				<div class="search-hots">
					<span>热词：</span>
					<a target="_blank" href="{$myf_path}/search/互联网">互联网</a>
					<a target="_blank" href="{$myf_path}/search/移动">移动</a>
					<a target="_blank" href="{$myf_path}/search/创业">创业</a>
				</div>
			</div>
			<div class="nav">
				<div id="date">
					<span>2013年6月21日 星期五</span><span><a href="{$myf_path}/sitemap.html" class="site">网站地图</a></span>
				</div>
				<div class="social">
					<a href="http://myfcms.minyifei.cn" rel="nofollow" target="_blank" class="mobile">手机浏览</a>
					<a href="http://weibo.com/myfcms" class="weibo" title="打开2014巴西世界杯完全指南新浪微博主页"  rel="nofollow"  target="_blank" >新浪微博</a>
					<a href="http://t.qq.com/myfcms" title="打开2014巴西世界杯完全指南腾讯微博主页"  rel="nofollow"  target="_blank" class="tencent">腾讯微博</a>
				</div>
			</div>
		</div>
		<div itemscope itemtype="http://schema.org/Article" id="menu" class="clearfix">
			<a href="{$myf_path}/">首页</a>
			{channel id=vo}
			<a href="{$vo.typeurl}">{$vo.typename}</a>
			{/channel}
		</div>
		<div id="body">
			<div id="hotnews" class="clearfix">
				<div class="hleft">
					<div id="flash">
						<div id="banner">
							<div id="banner_bg"></div><!--标题背景-->
							<div id="banner_info"></div><!--标题-->
							<ul>
								<li class="on">
									1
								</li>
								<li>
									2
								</li>
								<li>
									3
								</li>
								<li>
									4
								</li>
							</ul>
							<div id="banner_list">
								{arclist limit="5" id="flash" flag="f"}
								<a href="{$flash.arcurl}" target="_blank"><img src="{$flash.litpic}" title="{$flash.title}" alt="{$flash.title}"/></a>
								{/arclist}
							</div>
						</div>
					</div>
					<div id="topscore">
						<ul class="news">
							{arclist limit="5" id=vo}
							<li>
								<a href="{$vo.arcurl}" title="{$vo.title}" target="_blank"><b>{$vo.title}</b></a>
							</li>
							{/arclist}
						</ul>
					</div>
				</div>
				<div class="hcenter">
					<div class="hot">
						{arclist id="vo" limit="1" flag="h"}
						<h1><a href="{$vo.arcurl}" title="{$vo.title}"  target="_blank">{$vo.title}</a></h1>
						<div class="info">
							{$vo.description}
						</div>
						{/arclist}
					</div>
					<ul class="latest">
						{arclist id="arc" limit="8"}
						<li>
							<a href="{$arc.arcurl}" title="{$arc.title}"  target="_blank">{$arc.title}</a>
						</li>
						{/arclist}
					</ul>
				</div>
				<div class="hright">
					<div  class="ritem" style="background: none">
						<div class="item-title clearfix">
							<span><a href="#">排行榜</a></span>
						</div>
						<ul class="hnews">
							{arclist id="arc" limit="10" order="click desc"}
							<li>
								<a href="{$arc.arcurl}" title="{$arc.title}"  target="_blank">{$arc.title}</a>
							</li>
							{/arclist}
						</ul>
					</div>
				</div>
			</div>
			<div class="section">

			</div>
			<div class="row clearfix">
				<div class="ileft">
					{channel id=arctype index=2 topid=0 channeltype=article}
					<div class="item">
						<div class="item-title clearfix">
							<span><a href="{$arctype.typeurl}">{$arctype.typename}</a></span><a class="more" href="{$arctype.typeurl}"  rel="nofollow" >更多>></a>
						</div>
						{arclist id="arc" limit="1" flag="p" topid="{$arctype.id}"}
						<div class="pic-news clearfix">
							<div class="pic">
								<a href="{$arc.arcurl}" target="_blank" title="{$arc.title}" > <img src="{$arc.litpic|default:"$myf_path/public/images/nopic.jpg"}" width="120" height="90" style="width:120px;height:90px;" /> </a>
							</div>
							<div class="text">
								<h2><a href="{$arc.arcurl}" title="{$arc.title}"  target="_blank">{$arc.title}</a></h2>
								<div class="information">
									{$arc.description}
								</div>
							</div>
						</div>
						{/arclist}
						<ul class="news topline">
							{arclist id="arc" limit="5" topid="{$arctype.id}"}
							<li>
								<a href="{$arc.arcurl}" title="{$arc.title}"  target="_blank">{$arc.title}</a>
							</li>
							{/arclist}
						</ul>
					</div>
					{/channel}
					
					{channel id="type" channeltype=image}
            		<div class="pnews">
            			<h3>
            				<a href="{$type.typeurl}">{$type.typename}</a>
            			</h3>
            			<ul class="clearfix">
            				{arclist limit="8" topid={$type.id} id="arc" channeltype="image"}
							<li><a href="{$arc.arcurl}" title="{$arc.title}" target="_blank"><i style="width: 150px; height: 110px; overflow: hidden;"><img src="{$arc.litpic|default:"$myf_theme_path/public/images/nopic.jpg"}" alt="{$arc.title}" width="150" height="110"></i><b>{$arc.title}</b></a></li>
							{/arclist}
		       		    </ul>
            		</div>
            		{/channel}
				</div>
				<div class="iright">
					<div class="item-title clearfix">
						<span><a href="javascript:void(0)">图文资讯</a></span>
					</div>
					<ul class="picture">
						{arclist id="arc" limit="9" flag="p"}
						<li>
							<a href="{$arc.arcurl}" title="{$arc.title}" target="_blank">
							<div class="spic"><img src="{$arc.litpic|default:"$myf_theme_path/public/images/nopic.jpg"}" width="220" />
							</div><b>{$arc.title}</b></a>
						</li>
						{/arclist}
					</ul>
				</div>
			</div>
			<div class="section"></div>
			<div class="row">
				<div id="player">
					<div class="item-title clearfix">
						<span><a href="javascript:void(0)">精彩图片</a></span><a class="more" href="{$myf_path}/footballmogul"  rel="nofollow" >更多>></a>
					</div>
					<ul class="clearfix">
						{arclist id="arc" limit="9" flag=p channeltype=image}
						<li>
							<a href="{$arc.arcurl}" title="{$arc.title}" target="_blank"> <img src="{$arc.litpic|default:"$myf_theme_path/public/images/nopic.jpg"}" /> <b>{$arc.title}</b> </a>
						</li>
						{/arclist}
					</ul>
				</div>
			</div>
			<div class="row" id="links">
				<div class="item-title clearfix">
					<span>合作伙伴</span>
				</div>
				<div class="linkbox">
					<dl>
						<dt>
							导航鸣谢
						</dt>
						<dd>
							<a href="http://hao.360.cn/" title="360安全导航" target="_blank" rel="nofollow" >360安全导航</a>
						</dd>
						<dd>
							<a href="http://www.hao123.com/" title="hao123导航" target="_blank" rel="nofollow">hao123导航</a>
						</dd>
						<dd>
							<a href="http://www.tao123.com/" title="淘网址" target="_blank" rel="nofollow" >淘网址</a>
						</dd>
						<dd>
							<a href="http://123.duba.net/" title="金山网址导航" target="_blank" rel="nofollow">金山网址导航</a>
						</dd>
					</dl>
					<dl>
						<dt>
							新闻媒体
						</dt>
						{flink id=vo flag="internet"}
						<dd>
							<a href="{$vo.linkurl}" title="{$vo.webname}" target="_blank" rel="nofollow">{$vo.webname}</a>
						</dd>
						{/flink}
					</dl>
					<dl>
						<dt>
							友情链接
						</dt>
						{flink id="vo"}
						<dd>
							<a href="{$vo.linkurl}" title="{$vo.webname}" target="_blank" rel="nofollow">{$vo.webname}</a>
						</dd>
						{/flink}
					</dl>
				</div>
			</div>
		</div>
		{include file="bottom.html"}
		<script src="{$myf_theme_path}/public/js/jquery-1.8.1.min.js"></script>
		<script type="text/javascript">
			{literal}
			//flash切换
			var t = n = 0, count;
			$(document).ready(function() {
				count = $("#banner_list a").length;
				$("#banner_list a:not(:first-child)").hide();
				$("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt'));
				$("#banner_info").click(function() {
					window.open($("#banner_list a:first-child").attr('href'), "_blank")
				});
				$("#banner li").click(function() {
					var i = $(this).text() - 1;
					//获取Li元素内的值，即1，2，3，4
					n = i;
					if (i >= count)
						return;
					$("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt'));
					$("#banner_info").unbind().click(function() {
						window.open($("#banner_list a").eq(i).attr('href'), "_blank")
					});
					$("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
					document.getElementById("banner").style.background = "";
					$(this).toggleClass("on");
					$(this).siblings().removeAttr("class");
				});
				t = setInterval("showAuto()", 4000);
				$("#banner").hover(function() {
					clearInterval(t)
				}, function() {
					t = setInterval("showAuto()", 4000);
				});
				//搜索
				$("#btnSearch").click(function() {
					$("#searchForm").submit();
				});
				$("#txtSearchKeyword").keydown(function(e) {
					var keyword = $(this).val();
					if (e.keyCode == 13 && keyword != "") {
						$("#searchForm").submit();
					}
				});
			});

			function showAuto() {
				n = n >= (count - 1) ? 0 : ++n;
				$("#banner li").eq(n).trigger('click');
			} 
			{/literal}
		</script>
	</body>
</html>