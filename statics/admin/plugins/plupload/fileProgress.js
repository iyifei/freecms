/*global plupload */
/*global qiniu */
function FileProgress(file, targetID) {
    this.fileProgressID = file.id;
    this.file = file;

    this.opacity = 100;
    this.height = 0;
    this.fileProgressWrapper = $('#' + this.fileProgressID);
    if (!this.fileProgressWrapper.length) {
        this.fileProgressWrapper = $('<tr></tr>');
        var Wrappeer = this.fileProgressWrapper;
        Wrappeer.attr('id', this.fileProgressID).addClass('progressContainer');

        var progressText = $("<td style='width:50%;'/>");
        progressText.addClass('progressName').text(file.name);


        var fileSize = plupload.formatSize(file.size).toUpperCase();
        var progressSize = $("<td/>");
        progressSize.addClass("progressFileSize").text(fileSize);

        var progressBarTd = $("<td/>");
        var progressBarBox = $("<div/>");
        progressBarBox.addClass('info');
        var progressBarWrapper = $("<div/>");
        progressBarWrapper.addClass("progress progress-striped");

        var progressBar = $("<div/>");
        progressBar.addClass("progress-bar progress-bar-info")
            .attr('role', 'progressbar')
            .attr('aria-valuemax', 100)
            .attr('aria-valuenow', 0)
            .attr('aria-valuein', 0)
            .width('0%');

        var progressBarPercent = $('<span class=sr-only />');
        progressBarPercent.text(fileSize);

        var progressCancel = $('<a class="" href=javascript:; ><span class="glyphicon glyphicon-remove"></span></a>');
        progressCancel.show().addClass('progressCancel');

        progressBar.append(progressBarPercent);
        progressBarWrapper.append(progressBar);
        progressBarBox.append(progressBarWrapper);
        progressBarBox.append(progressCancel);

        var progressBarStatus = $('<div class="status text-center"/>');
        progressBarBox.append(progressBarStatus);
        progressBarTd.append(progressBarBox);

        Wrappeer.append(progressText);
        Wrappeer.append(progressSize);
        Wrappeer.append(progressBarTd);

        $('#' + targetID).append(Wrappeer);
    } else {
        this.reset();
    }

    this.height = this.fileProgressWrapper.offset().top;
    this.setTimer(null);
}

FileProgress.prototype.setTimer = function(timer) {
    this.fileProgressWrapper.FP_TIMER = timer;
};

FileProgress.prototype.getTimer = function(timer) {
    return this.fileProgressWrapper.FP_TIMER || null;
};

FileProgress.prototype.reset = function() {
    this.fileProgressWrapper.attr('class', "progressContainer");
    this.fileProgressWrapper.find('td .progress .progress-bar-info').attr('aria-valuenow', 0).width('0%').find('span').text('');
    this.appear();
};

FileProgress.prototype.setChunkProgess = function(chunk_size) {
    var chunk_amount = Math.ceil(this.file.size / chunk_size);
    if (chunk_amount === 1) {
        return false;
    }

    //var viewProgess = $('<button class="btn btn-default">查看分块上传进度</button>');

    var progressBarChunkTr = $('<tr class="chunk-status-tr"><td colspan=3></td></tr>');
    var progressBarChunk = $('<div/>');
    for (var i = 1; i <= chunk_amount; i++) {
        var col = $('<div class="col-md-2"/>');
        var progressBarWrapper = $('<div class="progress progress-striped"></div');

        var progressBar = $("<div/>");
        progressBar.addClass("progress-bar progress-bar-info text-left")
            .attr('role', 'progressbar')
            .attr('aria-valuemax', 100)
            .attr('aria-valuenow', 0)
            .attr('aria-valuein', 0)
            .width('0%')
            .attr('id', this.file.id + '_' + i)
            .text('');

        var progressBarStatus = $('<span/>');
        progressBarStatus.addClass('chunk-status').text();

        progressBarWrapper.append(progressBar);
        progressBarWrapper.append(progressBarStatus);

        col.append(progressBarWrapper);
        progressBarChunk.append(col);
    }

    if(!this.fileProgressWrapper.find('td:eq(2) .btn-default').length){
        //this.fileProgressWrapper.find('td>div').append(viewProgess);
    }
    progressBarChunkTr.hide().find('td').append(progressBarChunk);
    progressBarChunkTr.insertAfter(this.fileProgressWrapper);

};

FileProgress.prototype.setProgress = function(percentage, speed, chunk_size) {
    this.fileProgressWrapper.attr('class', "progressContainer green");

    var file = this.file;
    var uploaded = file.loaded;

    var size = plupload.formatSize(uploaded).toUpperCase();
    var formatSpeed = plupload.formatSize(speed).toUpperCase();
    var progressbar = this.fileProgressWrapper.find('td .progress').find('.progress-bar-info');
    if (this.fileProgressWrapper.find('.status').text() === '取消上传'){
        return;
    }
    //this.fileProgressWrapper.find('.status').text("已上传: " + size + " 上传速度： " + formatSpeed + "/s");
    percentage = parseInt(percentage, 10);
    if (file.status !== plupload.DONE && percentage === 100) {
        percentage = 99;
    }

    progressbar.attr('aria-valuenow', percentage).css('width', percentage + '%');

    if (chunk_size) {
        var chunk_amount = Math.ceil(file.size / chunk_size);
        if (chunk_amount === 1) {
            return false;
        }
        var current_uploading_chunk = Math.ceil(uploaded / chunk_size);
        var pre_chunk, text;

        for (var index = 0; index < current_uploading_chunk; index++) {
            pre_chunk = $('#' + file.id + "_" + index);
            pre_chunk.width('100%').removeClass().addClass('alert-success').attr('aria-valuenow', 100);
            text = "块" + index + "上传进度100%";
            pre_chunk.next().html(text);
        }

        var currentProgessBar = $('#' + file.id + "_" + current_uploading_chunk);
        var current_chunk_percent;
        if (current_uploading_chunk < chunk_amount) {
            if (uploaded % chunk_size) {
                current_chunk_percent = ((uploaded % chunk_size) / chunk_size * 100).toFixed(2);
            } else {
                current_chunk_percent = 100;
                currentProgessBar.removeClass().addClass('alert-success');
            }
        } else {
            var last_chunk_size = file.size - chunk_size * (chunk_amount - 1);
            var left_file_size = file.size - uploaded;
            if (left_file_size % last_chunk_size) {
                current_chunk_percent = ((uploaded % chunk_size) / last_chunk_size * 100).toFixed(2);
            } else {
                current_chunk_percent = 100;
                currentProgessBar.removeClass().addClass('alert-success');
            }
        }
        currentProgessBar.width(current_chunk_percent + '%');
        currentProgessBar.attr('aria-valuenow', current_chunk_percent);
        text = "块" + current_uploading_chunk + "上传进度" + current_chunk_percent + '%';
        currentProgessBar.next().html(text);
    }

    this.appear();
};

FileProgress.prototype.setComplete = function(up, info) {
    var td = this.fileProgressWrapper.find('td:eq(2)'),
        tdProgress = td.find('.progress');

    //var res = $.parseJSON(info);
    var res = info;
    var hash = res.key;
    var url;
    if (res.url) {
        url = res.url;
        str = "<div id='info-"+hash+"'><div><strong>Link:</strong><a href=" + res.url + " target='_blank' > " + res.url + "</a></div>" +
            "<div class=hash><strong>Hash:</strong>" + res.hash + "</div></div>";
    } else {
        var domain = up.getOption('domain');
        url = domain + encodeURI(res.key);
        var link = domain + res.key;
        str = "<div id='info-"+hash+"'><div><strong>Link:</strong><a href=" + url + " target='_blank' > " + link + "</a></div>" +
            "<div class=hash><strong>Hash:</strong>" + res.hash + "</div></div>";
    }
    str = "<div id='info-"+hash+"'></div>";

    tdProgress.html(str).removeClass().next().next('.status').hide();
    td.find('.progressCancel').hide();

    var progressNameTd = this.fileProgressWrapper.find('.progressName');
    var imageView = '?thumbnail=h-80';

    var isImage = function(url) {
        var res, suffix = "";
        var imageSuffixes = ["png", "jpg", "jpeg", "gif", "bmp"];
        var suffixMatch = /\.([a-zA-Z0-9]+)(\?|\@|$)/;

        if (!url || !suffixMatch.test(url)) {
            return false;
        }
        res = suffixMatch.exec(url);
        suffix = res[1].toLowerCase();
        for (var i = 0, l = imageSuffixes.length; i < l; i++) {
            if (suffix === imageSuffixes[i]) {
                return true;
            }
        }
        return false;
    };

    var isImg = isImage(url);

    var Wrapper = $('<div class="Wrapper"/>');
    var imgWrapper = $('<div class="imgWrapper col-md-3"/>');
    var linkWrapper = $('<a class="linkWrapper" target="_blank"/>');
    var showImg = $('<img src="/images/loading.gif"/>');

    progressNameTd.append(Wrapper);

    if (!isImg) {
        showImg.attr('src', 'images/default.png');
        Wrapper.addClass('default');

        imgWrapper.append(showImg);
        Wrapper.append(imgWrapper);
    } else {
        linkWrapper.append(showImg);
        imgWrapper.append(linkWrapper);
        Wrapper.append(imgWrapper);

        var img = new Image();
        if (!/imageView/.test(url)) {
            url += imageView
        }
        $(img).attr('src', url);

        var height_space = 340;
        $(img).on('load', function() {
            showImg.attr('src', url);

            //linkWrapper.attr('href', url).attr('title', '查看原图');

            function initImg(url, key, height) {
                $('#myModal-img').modal();
                var modalBody = $('#myModal-img').find('.modal-body');
                if (height <= 300) {
                    $('#myModal-img').find('.text-warning').show();
                }
                var newImg = new Image();
                modalBody.find('img').attr('src', 'images/loading.gif');
                newImg.onload = function() {
                    modalBody.find('img').attr('src', url).data('key', key).data('h', height);
                    modalBody.find('.modal-body-wrapper').find('a').attr('href', url);
                };
                newImg.src = url;
            }

            var infoWrapper = $('<div class="infoWrapper col-md-6"></div>');

            Wrapper.append(infoWrapper);

        }).on('error', function() {
            showImg.attr('src', 'default.png');
            Wrapper.addClass('default');
        });
    }
};

FileProgress.prototype.detectIEVersion = function() {
    var v = 4,
        div = document.createElement('div'),
        all = div.getElementsByTagName('i');
    while (
        div.innerHTML = '<!--[if gt IE ' + v + ']><i></i><![endif]-->',
            all[0]
        ) {
        v++;
    }
    return v > 4 ? v : false;
};



FileProgress.prototype.setError = function() {
    this.fileProgressWrapper.find('td:eq(2)').attr('class', 'text-warning');
    this.fileProgressWrapper.find('td:eq(2) .progress').css('width', 0).hide();
    this.fileProgressWrapper.find('button').hide();
    this.fileProgressWrapper.next('.chunk-status-tr').hide();
};

FileProgress.prototype.setCancelled = function(manual) {
    var progressContainer = 'progressContainer';
    if (!manual) {
        progressContainer += ' red';
    }
    this.fileProgressWrapper.attr('class', progressContainer);
    this.fileProgressWrapper.find('td .progress').remove();
    this.fileProgressWrapper.find('td:eq(2) .btn-default').hide();
    this.fileProgressWrapper.find('td:eq(2) .progressCancel').hide();
};

FileProgress.prototype.setStatus = function(status, isUploading) {
    if (!isUploading) {
        this.fileProgressWrapper.find('.status').text(status).attr('class', 'status text-left');
    }
};

// 绑定取消上传事件
FileProgress.prototype.bindUploadCancel = function(up) {
    var self = this;
    if (up) {
        self.fileProgressWrapper.find('td:eq(2) .progressCancel').on('click', function(){
            self.setCancelled(false);
            self.setStatus("取消上传");
            self.fileProgressWrapper.find('.status').css('left', '0');
            up.removeFile(self.file);

            //媒体资源数减一
            mediaCount--;
        });
    }

};

FileProgress.prototype.appear = function() {
    if (this.getTimer() !== null) {
        clearTimeout(this.getTimer());
        this.setTimer(null);
    }

    if (this.fileProgressWrapper[0].filters) {
        try {
            this.fileProgressWrapper[0].filters.item("DXImageTransform.Microsoft.Alpha").opacity = 100;
        } catch (e) {
            // If it is not set initially, the browser will throw an error.  This will set it if it is not set yet.
            this.fileProgressWrapper.css('filter', "progid:DXImageTransform.Microsoft.Alpha(opacity=100)");
        }
    } else {
        this.fileProgressWrapper.css('opacity', 1);
    }

    this.fileProgressWrapper.css('height', '');

    this.height = this.fileProgressWrapper.offset().top;
    this.opacity = 100;
    this.fileProgressWrapper.show();

};
