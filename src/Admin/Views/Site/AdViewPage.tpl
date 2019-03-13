<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    {include file="../Common/Head.tpl"}
</head>
<body style="background: none">
<!-- begin #content -->
<div class="content-full-width">
    <!-- begin row -->
    <div class="row">
        <!-- begin col-12 -->
        <div class="col-lg-12">
            <h3>广告位js调用代码</h3>
            <div style="margin-top:20px;"  class="note note-primary">
                &lt;script src="{literal}{$myf_path}{/literal}/adjs?id={$data.id}"&gt;&lt;/script&gt;
            </div>
            <h3>效果预览</h3>
            <p class="m-t-20">
                <script src="{$myf_path}/adjs?id={$data.id}"></script>
            </p>
        </div>
        <!-- end col-12 -->
    </div>
    <!-- end row -->
</div>

<!-- end #content -->
<!-- end page container -->
{include file="../Common/BaseJs.tpl"}

<script>
</script>
</body>
</html>
