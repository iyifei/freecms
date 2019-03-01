<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>测试标签</title>
</head>
<body>
<ul>
{arclist id='arc' limit='0,10' orderby='id desc' key='k' channel='article'}
    <li>
        <a href='{$arc.arcurl}'>{$arc.title}</a>
    </li>
{/arclist}
</ul>
</body>
</html>