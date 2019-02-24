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
