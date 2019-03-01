<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>上传文件</title>
    <link href="{$myf_path}/statics/admin/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="{$myf_path}/statics/admin/plugins/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="{$myf_path}/statics/admin/plugins/plupload/plupload.full.min.js"></script>
    <script type="text/javascript" src="{$myf_path}/statics/admin/plugins/progressbar.js/progressbar.min.js"></script>
    <style>
        #progress {
            height: 20px;
            margin-top: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
        }
        #progress > svg {
            height: 100%;
            display: block;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="container" style="margin-top: 30px;">
        <div class="row">
            <div style="width:75%;float:left;margin-right:10px;"><input type="text" class="form-control form-control-sm" readonly id="txtFile"></div>
            <div style="width:20%;float:left;"><a id="pickfiles" href="javascript:void(0)" class="btn btn-info btn-sm"><span>浏览…</span></a></div>
        </div>
    </div>
    <div class="row">
        <div class="col-md">
            <div id="progress"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-md">
            {foreach from=$exts item=ext}
                <p class="text-dark">{$ext.title}&nbsp;支持后缀：{$ext.extensions}</p>
            {/foreach}
        </div>
    </div>
    <div id="resultError" class="red" style="margin-top: 20px;text-align: center;display: none">
    </div>
</div>
<div id="container"></div>


<script type="text/javascript">

    var progressBar = new ProgressBar.Line('#progress', {
        trailColor:"#ccc",
        color: '#FCB03C',
        duration: 800
    });

    var uploadUrl = "{$uploadUrl}";
    var uploader = new plupload.Uploader({
        multi_selection: false,
        file_data_name:"file",
        runtimes: 'html5,flash,silverlight,html4',
        browse_button: 'pickfiles', // you can pass an id...
        container: document.getElementById('container'), // ... or DOM Element itself
        url: uploadUrl,
        flash_swf_url: '{$myf_path}/statics/admin/plugins/plupload/Moxie.swf',
        silverlight_xap_url: '{$myf_path}/statics/admin/plugins/plupload/Moxie.xap',
        filters: {
            max_file_size: '{$size}mb',
            mime_types: {$extJson}
        },

        init: {
            FilesAdded: function (up, files) {
                plupload.each(files, function (file) {
                    $("#txtFile").val(file.name);
                });
                progressBar.animate(0);
            },
            'BeforeUpload': function (up, file) {
                //重置key
                var newName = "media/file/" + file.name;
                var params = up.settings.multipart_params;
                params.key = newName;

            },
            'UploadProgress': function (up, file) {
                progressBar.animate(file.loaded/file.size);
                $("#progressText").html(file.percent + "%");
            },
            'FileUploaded': function (up, file, info) {
                progressBar.animate(1);
                $("#progressText").html("完成");
                var res = $.parseJSON(info.response);
                var data = res.data;
                data.type = '{$type}';
                //回调
                if(typeof parent.uploadCallback === 'function'){
                    parent.uploadCallback(data);
                }
            },
            'Error': function (up, err, errTip) {
                //上传出错时,处理相关的事情
                $("#resultError").html(errTip).show();
            },
            'UploadComplete': function () {
            }
        }
    });

    uploader.init();


    function doUploadFile() {
        $("#resultError").hide().html('');
        uploader.start();
    }
</script>
</body>
</html>