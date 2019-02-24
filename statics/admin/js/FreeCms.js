var FreeCms = {};
//编辑页面提交数据
FreeCms.doEditSubmit=function () {

    //前置函数
    if(typeof beforeSubmitFun === 'function'){
        beforeSubmitFun();
    }

    var isCheck = true;
    $("form input").each(function () {

        var id = $(this).attr("id");
        if ($(this).attr("required") == 'required' && $.trim($(this).val()) == "") {
            $("#error_" + id).addClass('error').html('必填字段');
            $(this).addClass('fm-text-error');
            isCheck = false;
        } else {
            $("#error_" + id).removeClass('error').html('');
            $(this).removeClass('fm-text-error');
        }
    });

    if(isCheck){
        var url = $("#submitUrl").val();
        $.post(url, FreeCms.serializeObject($("form")), function (result) {
            //成功
            if (result.status == 0) {
                setTimeout(function () {
                    if(typeof callbackSaveSuccess === 'function'){
                        callbackSaveSuccess();
                    }
                }, 300);
            } else {
                alert('error');
            }
        }, 'json');
    }
};

//批量更新
FreeCms.batchSave = function (key) {
    var list = [];
    $("."+key).each(function () {
        var id = $(this).attr("did");
        var val = $(this).val();
        var item = {
            id:id,
            key:key,
            val:val
        };
        list.push(item);
    });
    var json = JSON.stringify(list);
    var data = {
        list:json,
        method:'batch'
    };
    var saveUrl = $("#saveUrl").val();
    $.post(saveUrl,data,function (result) {
        if(result.status==0){
            if(typeof successCallback === 'function'){
                successCallback();
            }
        }else{
            FreeCms.error(result.errmsg);
        }
    });
};

//单个字段更新
FreeCms.oneSave = function (id,key,val) {
    var data = {
        id:id,
        method:'edit',
        key:key,
        val:val
    };
    var saveUrl = $("#saveUrl").val();
    $.post(saveUrl,data,function (result) {
        if(result.status==0){
            if(typeof successCallback === 'function'){
                successCallback();
            }
        }else{
            FreeCms.error(result.errmsg);
        }
    })
};

//删除记录
FreeCms.deleteRow = function (id) {
    //询问框
    FreeCms.confirm('确定删除?删除后无法恢复？', function(){
        var data = {
            id:id
        };
        var url = $("#deleteUrl").val()+"?method=delete";
        $.post(url,data,function (result) {
            if(result.status==0){
                if(typeof successCallback === 'function'){
                    successCallback();
                }
            }else{
                FreeCms.error(result.errmsg);
            }
        });
    });
};

//批量删除
FreeCms.batchDeleteRows = function () {
    var ids = [];
    $(".chkid").each(function () {
        var checked = $(this).is(':checked');
        if(checked){
            ids.push($(this).val());
        }
    });
    if(ids.length>0){
        //询问框
        FreeCms.confirm('确定删除?删除后无法恢复？', function(){
            var data = {
                ids:ids.join(',')
            };
            var url = $("#deleteUrl").val()+"?method=batch_delete";
            $.post(url,data,function (result) {
                if(result.status==0){
                    if(typeof successCallback === 'function'){
                        successCallback();
                    }
                }else{
                    FreeCms.error(result.errmsg);
                }
            });
        });
    }else{
        FreeCms.info('请选择需要删除的内容');
    }
};

//处理form表单数据
FreeCms.serializeObject = function (form) {
    var o = {};
    $.each(form.serializeArray(), function (index) {
        if (this['value'] != undefined && this['value'].length > 0) {
            // 如果表单项的值非空，才进行序列化操作
            if (o[this['name']]) {
                o[this['name']] = o[this['name']] + "," + this['value'];
            } else {
                o[this['name']] = this['value'];
            }
        }
    });
    return o;
};

//成功提示
FreeCms.success = function (msg,afterFun) {
    $.toast({
        heading: '成功',
        text: msg,
        position: 'top-center',
        icon: 'success',
        hideAfter:1500,
        afterHidden:function () {
            if(typeof afterFun === 'function'){
                afterFun();
            }
        }
    })
};

//出错
FreeCms.error = function (msg,afterFun) {
    $.toast({
        heading: '出错',
        text: msg,
        position: 'top-center',
        icon: 'error',
        afterHidden:function () {
            if(typeof afterFun === 'function'){
                afterFun();
            }
        }
    })
};

//警告
FreeCms.warn = function (msg,afterFun) {
    $.toast({
        heading: '警告',
        text: msg,
        position: 'top-center',
        icon: 'warning',
        afterHidden:function () {
            if(typeof afterFun === 'function'){
                afterFun();
            }
        }
    })
};

//警告
FreeCms.info = function (msg,afterFun) {
    $.toast({
        heading: '提示',
        text: msg,
        position: 'top-center',
        icon: 'info',
        afterHidden:function () {
            if(typeof afterFun === 'function'){
                afterFun();
            }
        }
    })
};

//确认框
FreeCms.confirm = function (msg,succFun) {
    swal({
        title: '确认操作?',
        text: msg,
        icon: 'info',
        buttons: {
            cancel: {
                text: '取消',
                value: null,
                visible: true,
                className: 'btn btn-default',
                closeModal: true,
            },
            confirm: {
                text: '确认',
                value: true,
                visible: true,
                className: 'btn btn-primary',
                closeModal: true
            }
        }
    }).then((value) => {
        if(value && typeof succFun ==='function'){
            succFun();
        }
    });
}
