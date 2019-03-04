<div>
	{if empty($CurrentMember)}
		未登录
		{else}
		当前登录用户：{$CurrentMember.uname|default:$CurrentMember.userid}
	{/if}
</div>