<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>批量上传文件</title>
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
        table.myf-table-border{
            border: 1px solid #e2e7eb;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4">
            <a id="pickfiles" href="javascript:void(0)" class="btn btn-info btn-sm"><span>添加文件…</span></a>
        </div>
        <div class="col-md-8">
            {foreach from=$exts item=ext}
                <span class="text-dark">{$ext.title}&nbsp;支持后缀：{$ext.extensions}</span>
            {/foreach}
        </div>
    </div>
    <div class="row" style="padding-top: 10px;">
        <div class="col-md">
            <div class="table-responsive">
                <table id="picBox" class="table table-hover myf-table-border">
                    <thead>
                    <tr>
                        <th>名称</th>
                        <th colspan="2">进度</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div id="resultError" class="red" style="margin-top: 20px;text-align: center;display: none">
    </div>
</div>
<div id="container"></div>
<textarea id="templateItem" style="display: none">
    <tr>
        <td>名称：#name#</td>
        <td><div id="progress_#id#" class="progress"></div></td>
        <td><span id="progressText_#id#" class="tinfo" style="margin-left: 10px;">0%</span></td>
    </tr>
</textarea>


<script type="text/javascript">

    var totalCount = 0;
    var progressBars = new Map();
    var uploadUrl = "{$uploadUrl}";
    var uploader = new plupload.Uploader({
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
                    var template = $("#templateItem").val();
                    var name =file.name;
                    var id =file.id;
                    var html = template.replace(/#id#/g,id).replace(/#name#/g,name);
                    $("#picBox tbody").append(html);
                    var progressBar = new ProgressBar.Line('#progress_'+id, {
                        trailColor:"#ccc",
                        color: '#FCB03C',
                        duration: 800
                    });
                    progressBars.set(id,progressBar);
                    totalCount++;
                });
            },
            'BeforeUpload': function (up, file) {
                //重置key
                var newName = "media/file/" + file.name;
                var params = up.settings.multipart_params;
                params.key = newName;

            },
            'UploadProgress': function (up, file) {
                var id = file.id;
                var progressBar = progressBars.get(id);
                progressBar.animate(file.loaded/file.size);
                $("#progressText_"+id).html(file.percent + "%");
            },
            'FileUploaded': function (up, file, info) {
                var id = file.id;
                var progressBar = progressBars.get(id);
                progressBar.animate(1);
                $("#progressText_"+id).html("完成");
                var res = $.parseJSON(info.response);
                var data = res.data;
                data.total = --totalCount;
                //回调
                if(typeof parent.uploadFilesCallback === 'function'){
                    parent.uploadFilesCallback(data);
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

    function submitForm() {
        doUploadFile();
    }

    function doUploadFile() {
        $("#resultError").hide().html('');
        uploader.start();
    }
</script>
</body>
</html>