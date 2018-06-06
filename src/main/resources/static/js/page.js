//总页数
var currentPage = 1;
var pageUrl = "";
var pageType = "";
var firstPage;
var lastPage;
var category_id;
var categoryName;

function loadPage(page, first, last, url, type, category_id, cateName) {
    currentPage = page;
    pageUrl = url;
    pageType = type;
    firstPage = first;
    lastPage = last;
    categoryId = category_id;
    categoryName = cateName
    //初始化
    if (currentPage == 1 && lastPage) {
        $(".pages").hide();
        showLists(currentPage, pageType)
    } else {
        $(".pages").show();
        showLists(currentPage, pageType)
    }
}

/*true true  只有一页
true  false  第一页加还有其他业   下一页
false true   最后一页   上一页
false false  中间业     上一页  下一页*/

// 分页
function showPages(currentPage, firstPage, lastPage) {
    var str = '';
    if (!firstPage) {
        str += '<a href="javascript:;" class="prevOn" rel="prev" onclick="jump(this)">上一页</a>'
    } else {
        str += '<a href="javascript:;" class="prev">上一页</a>'
    }
    /* if(firstPage&&!lastPage){
         str+='<a href="javascript:;" class="now">'+currentPage+'</a><a href="javascript:;" onclick="jump(this)">'+(currentPage+1)+'</a><a href="javascript:;">...</a>'
     }
     if(!firstPage&&lastPage){
         if(currentPage==2){
             str+='<a href="javascript:;"  onclick="jump(this)">'+(currentPage-1)+'</a><a href="javascript:;" class="now">'+(currentPage)+'</a>'
         }else{
             str+='<a href="javascript:;">...</a><a href="javascript:;"  onclick="jump(this)">'+(currentPage-1)+'</a><a href="javascript:;" class="now">'+(currentPage)+'</a>'
         }
     }

     if(!firstPage&&!lastPage){
         str+='<a href="javascript:;">...</a><a href="javascript:;" onclick="jump(this)" >'+(currentPage-1)+'</a><a href="javascript:;" class="now">'+(currentPage)+'</a><a href="javascript:;"  onclick="jump(this)">'+(currentPage+1)+'</a><a href="javascript:;">...</a>'
     }*/
    if (!lastPage) {
        str += '<a  class="nextOn" rel="next" onclick="jump(this)">下一页</a>'
    } else {
        str += '<a href="javascript:;" class="next">下一页</a>'
    }
    str += '<a href="javascript:;">当前第<span class="now">' + currentPage + '</span>页</a>'
    return str;
}

// 显示每页内容
function showLists(currentPage, pageType) {
    $.ajax({
        type: "GET",
        url: pageUrl + "&pageNo=" + currentPage + "&pageSize=" + 4,
        dataType: "json",
        success: function (data) {
            $(".page-no").html(showPages(currentPage, data.firstPage, data.lastPage));
            ;
            appendData(data, pageType);
        }
    });
}

function appendData(result, pageType) {
    switch (pageType) {
        case "cateList":
            if (result.list.length > 0) {
                $("#findDetail").find("li").remove();
                for (var i = 0; i < result.list.length; i++) {
                    var data = result.list[i];
                    var html = '';
                    if (i % 2 == 0) {
                        html += '<li style="margin-right: 0px;">'
                    }
                    if (i % 2 == 1) {
                        html += '<li>'
                    }
                    html += '  <div class="title"><b>' + data.deviceName + '</b> <a href="product?num=2&categoryId=' + categoryId + '&deviceId=' + data.id + '&cateName=' + categoryName + '" >+查看详情</a> </div><dl class="clearfix"><dt><a href=""><img src="' + data.mainImageUrl + '" alt=""/></a></dt><dd>';
                    html += '</dd> </dl><ul class="clearfix"> '
                    html += '<li class="clearfix"> <span>设备编号: ' + data.deviceNo + '</span> </li><li class="clearfix"><span>设备总数: ' + data.total + '台 </span></li> <li class="clearfix"><span>浏览次数：' + data.visitTotal + '次</span></li></ul>';
                    $("#findDetail").append(html)
                }
            }
            break;

        case "searchCateList":
            if (result.list.length > 0) {
                $("#findDetail").find("li").remove();
                for (var i = 0; i < result.list.length; i++) {
                    var data = result.list[i];
                    var html = '';
                    if (i % 2 == 0) {
                        html += '<li style="margin-right: 0px;">'
                    }
                    if (i % 2 == 1) {
                        html += '<li>'
                    }
                    html += '  <div class="title"><b>' + data.deviceName + '</b> <a href="product?num=2&categoryId=' + categoryId + '&deviceId=' + data.id + '&cateName=' + categoryName + '" >+查看详情</a> </div><dl class="clearfix"><dt><a href=""><img src="' + data.mainImageUrl + '" alt=""/></a></dt><dd>';
                    html += '</dd> </dl><ul class="clearfix"> '
                    html += '<li class="clearfix"> <span>设备编号: ' + data.deviceNo + '</span> </li><li class="clearfix"><span>设备总数: ' + data.total + '台 </span></li> <li class="clearfix"><span>浏览次数：' + data.visitTotal + '次</span></li></ul>';
                    $("#findDetail").append(html)
                }
            }


        default:
            break;
    }
}

//点击页码
function jump($this) {
    var num = parseInt($($this).html(), 10);
    var nowNum = parseInt($(".page-no").find(".now").html());
    var rel = $($this).attr("rel");
    switch (rel) {
        case "prev": {
            currentPage = nowNum - 1;
            break;
        }
        case "next": {
            currentPage = nowNum + 1;
            break;
        }
        default: {
            currentPage = num;
            break;
        }
    }
    showLists(currentPage, pageType);
}

//点击确认
$(".page-confirm").click(function () {
    var formPage = parseInt($(".form-control").val(), 10);
    if (isNaN(formPage)) {
        alert("请输入数字");
    } else if (formPage <= 0 || formPage > totalPage) {
        alert("请输入正确的页码");
    } else {
        $(".page-no").html(showPages(formPage, totalPage));
        showLists(formPage, pageType);
    }
})