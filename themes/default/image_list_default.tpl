<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="chrome=1">
	<title>{$freecms.title}</title>
	<meta name="description" content="{$freecms.description}"/>
	<meta name="keywords" content="{$freecms.keywords}"/>
</head>

<body>
<h1>图片栏目：{$freecms.title}</h1>
<ul class="viewlist clearfix">
    {list pagesize="2" id="vo" key="k"}
		<li>
			<div class="viewpostviews">
				<img src="{if !empty($vo.thumbnail)}{$vo.thumbnail}{else}{$cms_theme_path}/public/images/nopic.jpg{/if}"/>
			</div>
			<div class="postentry">
				<div class="listtitle"><h3><a target="_blank" title="{$vo.title}" href="{$vo.arcurl}">{$vo.title}</a>
					</h3></div>
				<p class="infor">{$vo.description}</p>
				<p class="meta">
					<span class="cmts">分类：<a href="{$vo.typeurl}">{$vo.typename}</a></span>
					<span class="cmts">标签：{$vo.keywords}</span>
					<span>时间：{$vo.pubtime}</span>
					<span>来源: {$vo.source}</span>
				</p>
			</div>
		</li>
    {/list}
</ul>
<div id="pager" class="clearfix">
    {pagination pagesize="2"}
</div>
</body>
</html>