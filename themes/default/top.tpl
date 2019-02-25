<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="chrome=1">
		<title>{$myfcms.title}-{global name="cfg_webname"}</title>
		<meta name="description" content="{$myfcms.description}" />
		<meta name="keywords" content="{$myfcms.keywords}" />
		<link rel="shortcut icon" href="/favicon.ico" />
		<link href="{$myf_theme_path}/public/css/sjb.css" rel="stylesheet" />
	</head>
	<body>
		<div id="menu" class="clearfix">
			<a href="{$myf_path}/"><img src="{$myf_theme_path}/public/images/logo_30.png" class="slogo" />首页</a>
			{channel id=vo index="menu"}
			<a href="{$vo.typeurl}">{$vo.typename}</a>
			{/channel}
		</div>
		<div id="body">
	        <div class="sectiontop">
        		<img src="{$myf_theme_path}/public/images/ad.gif" />
	        </div>
	        <div id="position" class="clearfix">
	        	<div class="main">
	        		您现在的位置：{$myfcms.position}
	        	</div>
	        	<div class="search">
	        		<form action="{$myf_path}/index.php" id="bdsearch" target="_blank">
	        			<input type="hidden" name="c" value="search" />
	        			<input name="a" type="text" value="在这里搜索..." onmouseover="this.focus();" onfocus="this.select();" onclick="{literal}if(this.value=='在这里搜索...'){this.value=''}" onblur="if(this.value==''){this.value='在这里搜索...'}{/literal}" class="text">
	        			<input type="submit" value="搜索" class="submit">
        			</form>
	        	</div>
	        </div>