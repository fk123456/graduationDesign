//显示弹出框
function showLayer(id) {//id是弹出层的id
    var w = $("#" + id).width();
    var h = $("#" + id).height();
    var oLeft = (document.body.scrollLeft || document.documentElement.scrollLeft) + (document.documentElement.clientWidth - w) / 2;
    var oTop = (document.body.scrollTop || document.documentElement.scrollTop) + (document.documentElement.clientHeight - h) / 2;
    $("#" + id).css("left", oLeft);
    /*$("#"+id).css("top",oTop);// 居中显示*/
    var oMask = $('<div class="mask"></div>')
    if ($(".mask").length == 0) {
        oMask.appendTo($("body"))
    }
    $("#" + id).fadeIn();
    $('body').css({'overflow': 'hidden'});
};

//隐藏弹出框
function hideLayer(id) {//id是弹出层的id
    $(".mask").remove();
    $("#" + id).fadeOut();
    $('body').css({'overflow': 'auto'});
};

//显示提示框
function showTip(id) {
    var oMask = $('<div class="mask"></div>');
    if ($(".mask").length == 0) {
        oMask.appendTo($("body"))
    }
    $("#" + id).fadeIn();
}

//隐藏提示框
function hideTip(id) {
    $(".mask").remove();
    $("#" + id).fadeOut();
}
