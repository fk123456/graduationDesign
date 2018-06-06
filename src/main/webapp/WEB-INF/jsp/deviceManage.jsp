<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
    <link rel="stylesheet" type="text/css" href="css/my.css">
    <link rel="stylesheet" type="text/css" href="css/thems.css">
    <link rel="stylesheet" type="text/css" href="css/model.css"/>
    <title></title>
</head>
<body>

<%@include file="parent.jsp" %>
<div class="scd clearfix">
    <div class="scd_r" style="width: 100%;min-height: 350px">
        <div class="pst">
            <span>仪器预订管理</span>
            <div class="pst_m">

                <div class="aa_search">
               <span class="edit-value-outer demo1">
                   <input class="edit-value" type="text" placeholder="请选择">
                </span>
                </div>

            </div>
        </div>
        <div class="scd_m">
            <ul class="down">

            </ul>
        </div>

    </div>
</div>
<%@include file="foot.jsp" %>
</body>
</html>

<script>

    function hideOrShow($this) {

        if ($this == undefined) {
            var length = $(".down").find(".info").length;
            for (var i = 0; i < length; i++) {
                $(".down").find(".info:eq(" + i + ")").addClass("hid")
            }
            $(".down").find(".info:eq(0)").removeClass("hid")
            $(".down").find(".info:eq(0)").addClass("show")
        } else {
            var length = $(".down").find(".info").length;
            for (var i = 0; i < length; i++) {
                if ($(".down").find(".info:eq(" + i + ")").hasClass("show")) {
                    $(".down").find(".info:eq(" + i + ")").removeClass("show")
                    $(".down").find(".info:eq(" + i + ")").addClass("hid")
                }
            }
            if ($($this).parent("li").next(".info").hasClass("hid")) {
                $($this).parent("li").next(".info").removeClass("hid")
                $($this).parent("li").next(".info").addClass("show")
                return;
            }
            //点自己不能关
            if ($($this).parent("li").next(".info").hasClass("show")) {
                $($this).parent("li").next(".info").removeClass("show")
                $($this).parent("li").next(".info").addClass("hid")
                return;
            }

        }

    }

    $(document).ready(function () {
        $.ajax({
            url: '/device/getOrderInfo?categoryId=' + loginCategoryId,
            type: 'GET',
            success: function (result) {
                $(".down").find(".info").remove();
                $(".down").find("li").remove();
                for (var i = 0; i < result.device.length; i++) {
                    var device = result.device;
                    var orderInfo = result.order;
                    var html = '<li><p><span><a href="product?num=2&categoryId=' + device[i].categoryId + '&deviceId=' + device[i].id + '&cateName=' + device[i].cateName + '">' + device[i].deviceName + '</a> </span>&nbsp;总数：' + device[i].total + ' &nbsp;';
                    if (device[i].show != null) {
                        html += ' <span style="color: red">' + device[i].show + '</span>';
                    }
                    html += '</p><a  class="deta" onclick="hideOrShow(this)">详情</a></li>'

                    if (orderInfo[i].length > 0) {
                        html += '     <div class="info">       <table width="100%" class="table">' +
                            '<colgroup><col width="3%"></col><col width="10%"></col><col width="5%">' +
                            '<col width="5%"></col><col width="12%"></col><col width="9%"></col>' +
                            '<col width="11%"></col><col width="7%"></col>' +
                            '<col width="13%"></col><col width="8.5%"></col><col width="12%"></col></colgroup>' +
                            '                <tr>\n' +
                            '                    <th>ID</th>\n' +
                            '                    <th>预约设备</th>\n' +
                            '                    <th>预约数量</th>\n' +
                            '                    <th>预约教室</th>\n' +
                            '                    <th>预约第几节课</th>\n' +
                            '                    <th>预约日期</th>\n' +
                            '                    <th>学号</th>\n' +
                            '                    <th>预约人</th>\n' +
                            '                    <th>学院年级</th>\n' +
                            '                    <th>手机号</th>\n' +
                            '                    <th>更改预约</th>\n' +
                            '                </tr>\n'
                        for (var k = 0; k < orderInfo[i].length; k++) {
                            if (k % 2 == 1) {
                                html += '<tr>';
                            } else {
                                html += '<tr class="alter">';
                            }
                            html += '                 <td>' + orderInfo[i][k].id + '</td>\n' +
                                '                    <td>' + orderInfo[i][k].deviceName + '</td>\n' +
                                '                    <td>' + orderInfo[i][k].book + '</td>\n' +
                                '                    <td>' + orderInfo[i][k].classroom + '</td>\n' +
                                '                    <td>' + orderInfo[i][k].course + '</td>\n' +
                                '                    <td>' + orderInfo[i][k].appointTime + '</td>\n'
                            if (orderInfo[i][k].info != null) {
                                html += '<td colspan="5">' + orderInfo[i][k].info + '</td>'
                            } else {
                                html += '             <td>' + orderInfo[i][k].certificateId + '</td>\n' +
                                    '                    <td>' + orderInfo[i][k].userName + '</td>\n' +

                                    '                    <td>' + orderInfo[i][k].cateName + orderInfo[i][k].grade + '</td>\n' +
                                    '                    <td>' + orderInfo[i][k].phone + '</td>\n'
                            }
                            if (orderInfo[i][k].deleteId == "0") {
                                html += '<td><select onchange="cancelAppoint(' + orderInfo[i][k].id + ',this,' + loginAccount + ')"><option value="0">已同意预订</option><option value="' + loginAccount + '">取消预订</option></select></td></tr>\n'
                            } else if (orderInfo[i][k].deleteId == "-1") {
                                html += '<td><select onchange="cancelAppoint(' + orderInfo[i][k].id + ',this,' + loginAccount + ')"><option value="-1">未同意预订</option><option value="0">同意预订</option><option value="' + loginAccount + '">取消预订</option></select></td></tr>\n'
                            } else if (orderInfo[i][k].deleteId == loginAccount) {
                                html += '<td>已被管理员(' + loginName + ')取消</td></tr>\n'
                            } else {
                                html += '<td>已被学生（' + orderInfo[i][k].userName + '）取消</td></tr>\n'
                            }

                            html += '                </tr>\n'
                        }
                        html += '            </table></div>'
                    }
                    else {
                        html += '<div class="info"><span class="noNews">无预约消息</span></div>'
                    }

                    $(".down").append(html);
                }
                hideOrShow();
            }
        })
        search();
    })

    function List(deviceName) {
        $.ajax({
            url: '/device/getOrderInfo?categoryId=' + loginCategoryId + "&deviceName=" + deviceName,
            type: 'GET',
            success: function (result) {
                $(".down").find(".info").remove();
                $(".down").find("li").remove();
                for (var i = 0; i < result.device.length; i++) {
                    var device = result.device;
                    var orderInfo = result.order;
                    var html = '<li><p><span><a href="product?num=2&categoryId=' + device[i].categoryId + '&deviceId=' + device[i].id + '&cateName=' + device[i].cateName + '">' + device[i].deviceName + '</a> </span>&nbsp;总数：' + device[i].total + ' &nbsp;';
                    if (device[i].show != null) {
                        html += ' <span style="color: red">' + device[i].show + '</span>';
                    }
                    html += '</p><a  class="deta" onclick="hideOrShow(this)">详情</a></li>'

                    if (orderInfo[i].length > 0) {
                        html += '     <div class="info">       <table width="100%" class="table">' +
                            '<colgroup><col width="3%"></col><col width="10%"></col><col width="5%">' +
                            '<col width="5%"></col><col width="12%"></col><col width="9%"></col>' +
                            '<col width="11%"></col><col width="7%"></col>' +
                            '<col width="13%"></col><col width="8.5%"></col><col width="12%"></col></colgroup>' +
                            '                <tr>\n' +
                            '                    <th>ID</th>\n' +
                            '                    <th>预约设备</th>\n' +
                            '                    <th>预约数量</th>\n' +
                            '                    <th>预约教室</th>\n' +
                            '                    <th>预约第几节课</th>\n' +
                            '                    <th>预约日期</th>\n' +
                            '                    <th>学号</th>\n' +
                            '                    <th>预约人</th>\n' +
                            '                    <th>学院年级</th>\n' +
                            '                    <th>手机号</th>\n' +
                            '                    <th>更改预约</th>\n' +
                            '                </tr>\n'
                        for (var k = 0; k < orderInfo[i].length; k++) {
                            if (k % 2 == 1) {
                                html += '<tr>';
                            } else {
                                html += '<tr class="alter">';
                            }
                            html += '                 <td>' + orderInfo[i][k].id + '</td>\n' +
                                '                    <td>' + orderInfo[i][k].deviceName + '</td>\n' +
                                '                    <td>' + orderInfo[i][k].book + '</td>\n' +
                                '                    <td>' + orderInfo[i][k].classroom + '</td>\n' +
                                '                    <td>' + orderInfo[i][k].course + '</td>\n' +
                                '                    <td>' + orderInfo[i][k].appointTime + '</td>\n'
                            if (orderInfo[i][k].info != null) {
                                html += '<td colspan="5">' + orderInfo[i][k].info + '</td>'
                            } else {
                                html += '             <td>' + orderInfo[i][k].certificateId + '</td>\n' +
                                    '                    <td>' + orderInfo[i][k].userName + '</td>\n' +

                                    '                    <td>' + orderInfo[i][k].cateName + orderInfo[i][k].grade + '</td>\n' +
                                    '                    <td>' + orderInfo[i][k].phone + '</td>\n'
                            }
                            if (orderInfo[i][k].deleteId == "0") {
                                html += '<td><select onchange="cancelAppoint(' + orderInfo[i][k].id + ',this,' + loginAccount + ')"><option value="0">已同意预订</option><option value="' + loginAccount + '">取消预订</option></select></td></tr>\n'
                            } else if (orderInfo[i][k].deleteId == "-1") {
                                html += '<td><select onchange="cancelAppoint(' + orderInfo[i][k].id + ',this,' + loginAccount + ')"><option value="-1">未同意预订</option><option value="0">同意预订</option><option value="' + loginAccount + '">取消预订</option></select></td></tr>\n'
                            } else if (orderInfo[i][k].deleteId == loginAccount) {
                                html += '<td>已被管理员(' + loginName + ')取消</td></tr>\n'
                            } else {
                                html += '<td>已被学生（' + orderInfo[i][k].userName + '）取消</td></tr>\n'
                            }

                            html += '                </tr>\n'
                        }


                        html += '            </table></div>'
                    }
                    else {
                        html += '<div class="info"><span class="noNews">无预约消息</span></div>'
                    }

                    $(".down").append(html);
                }
                hideOrShow();
            }
        })
    }

    function search() {
        $.ajax({
            url: '/device/getDeviceList?loginCategoryId=' + loginCategoryId,
            type: 'GET',
            success: function (result) {
                var arr = [];
                for (var i = 0; i < result.length; i++) {
                    arr[i] = result[i].deviceName;
                }
                $.search22("demo1", "edit-value", arr);
            }
        })
    }

    function cancelAppoint(orderId, $this) {
        var deleteId = $($this).val();
        var info = "";
        if (deleteId == "0") {
            info = "同意预订成功！！！"
        } else if (deleteId == loginAccount) {
            info = "取消预订成功！！！"
        }
        $.ajax({
            url: '/order/cancelAppoint?orderId=' + orderId + '&deleteId=' + deleteId,
            type: 'GET',
            success: function (result) {
                if (result.data == "success") {
                    layer.open({
                        content: info,
                    });
                }
            }
        })
    }
</script>

<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script>
    (function ($) {
        $.search22 = function (wrap, input, arr) {
            var oWrap = $("." + wrap);
            var proposals = arr;
            if (oWrap.find(".searchContent")) {
                oWrap.find(".searchContent").remove();
            }
            if (proposals == "" || proposals == null || proposals == undefined) {
                return false;
            }
            var proposalList = $("<ul></ul>");
            var inputBox = oWrap.find("." + input);
            var listr = "";
            proposalList.addClass("searchContent");
            var oLength = proposals.length;// 数据长度
            function showAll() {
                for (var i = 0; i < oLength; i++) {
                    listr += '<li>' + proposals[i] + '</li>';
                }
                proposalList.html(listr);
                oWrap.append(proposalList);
            }

            showAll();
            inputBox.each(function (i, dom) {
                $(dom).bind("input propertychange", function (e) {
                    var oUl = $(this).parent().find(".searchContent");
                    oUl.slideDown();
                    if (e.which != 13 && e.which != 27 && e.which != 38 && e.which != 40) {
                        oUl.empty();
                        if ($(dom).val() != '') {
                            var word = $(dom).val();
                            var liNum = 0;
                            for (var i = 0; i < proposals.length; i++) {
                                if (proposals[i].indexOf(word) > 0) {
                                    liNum++;
                                    oUl.append($('<li>' + proposals[i] + '</li>'));
                                }
                            }
                            if (liNum == 0) {
                                oUl.append($('<span>查询无备选数据</span>'));
                            } else {
                                oUl.find('li').eq(0).addClass('on');
                            }
                        } else {
                            oUl.html(listr);
                        }
                    }
                })
            })
            inputBox.each(function (i, dom) {
                $(dom).focus(function () {
                    $(".searchContent").slideUp();
                    var oUl = $(this).parent().find(".searchContent");
                    if (inputBox.val() != '') {
                        oUl.slideDown();
                    } else {
                        oUl.html(listr).slideDown();
                    }
                })
            })
            inputBox.each(function (i, dom) {
                $(dom).keyup(function (e) {
                    e.stopPropagation();
                })
                $(dom).keydown(function (e) {
                    var oUl = $(this).parent().find(".searchContent");
                    var $_val = $.trim($(this).val());
                    var lineh = oUl.find("li").eq(0).height();
                    var limit = (oUl.height()) / lineh - 2;

                    function UpOrDown(which) {
                        var list = oUl.find("li");
                        var size = list.size();
                        var whichOn = list.index($("li[class='on']"));

                        function resize() {
                            oUl.scrollTop(0);
                        }

                        if (which == 40) {
                            if (whichOn < 0) {
                                list.removeClass("on").eq(0).addClass("on");
                                resize();
                            } else if (whichOn < (size - 1)) {
                                list.removeClass("on").eq(whichOn + 1).addClass("on");
                                if (whichOn > limit) oUl.scrollTop((whichOn - limit) * lineh);
                            } else if (whichOn == (size - 1)) {
                                list.removeClass("on").eq(0).addClass("on");
                                resize();
                            }
                        } else {
                            if (whichOn <= 0) {
                                list.removeClass("on").eq(size - 1).addClass("on");
                                oUl.scrollTop((size - limit) * lineh);
                            } else if (whichOn > 0) {
                                list.removeClass("on").eq(whichOn - 1).addClass("on");
                                if (whichOn > limit) {
                                    oUl.scrollTop((whichOn - limit) * lineh);
                                } else {
                                    resize();
                                }
                            } else if (whichOn == (size - 1)) {
                                list.removeClass("on").eq(size).addClass("on");
                                resize();
                            }
                        }
                    }

                    if ((e.which == 38 || e.which == 40) && $_val.length > 0) {
                        UpOrDown(e.which);
                    } else if (e.which == 13) {
                        oUl.find("li[class='on']").trigger("click");
                        inputBox.blur();
                    }
                })
            })
            $(".searchContent").each(function (i, dom) {
                $(dom).delegate("li", "click", function (e) {
                    e.stopPropagation = e.stopPropagation || function stopPropagation() {
                        e.cancelBubble = true;
                    };
                    e.stopPropagation();
                    $(this).parent().find("li").removeClass('on');
                    $(this).addClass('on');
                    $(this).parent().slideUp();
                    $(this).parents("." + wrap).find("." + input).val($(this).parent().find("li[class='on']").html());
                    List($(this).parent().find("li[class='on']").html());
                })
            })
            $(document).bind("click", function (e) {
                var e = e || window.event; //浏览器兼容性
                var elem = e.target || e.srcElement;
                while (elem) { //循环判断至跟节点，防止点击的是div子元素
                    if (elem.className == wrap || elem.className == input) {
                        return;
                    }
                    elem = elem.parentNode;
                }
                $(".searchContent").slideUp();
            })
        }
    })(jQuery)
</script>

