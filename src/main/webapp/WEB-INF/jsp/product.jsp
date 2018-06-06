<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/model.css"/>
    <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <script type="text/javascript" src="plugins/pro/js/lib.js"></script>
    <script type="text/javascript" src="plugins/pro/js/zzsc.js"></script>
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="js/js_z.js"></script>
    <script type="text/javascript" src="js/page.js"></script>
    <script type="text/javascript" src="plugins/pro/js/base.js"></script>
    <link rel="stylesheet" type="text/css" href="css/thems.css">
    <script type="text/javascript" src="js/laydate.js"></script>
    <script type="text/javascript" src="js/page.js"></script>
</head>

<body>
<!--头部-->
<%@include file="parent.jsp" %>
<!--头部-->
<!--幻灯片-->
<%--<div class="banner banner_s"><img src="upload/banner_1.jpg" alt=""/></div>--%>
<!--幻灯片-->
<div class="space_hx">&nbsp;</div>
<div class="scd clearfix">
    <div class="scd_l">
        <div class="name">分 院</div>
        <ul class="s_nav clearfix" id="nav_fk">

        </ul>
        <div class="space_hx">&nbsp;</div>
        <div class="l_pro">
            <div class="l_pname"><span>分院设备排行</span></div>
            <ul class="visitTotal">

            </ul>
        </div>
    </div>
    <div class="scd_r" id="categoryList">
        <div class="pst">
            <span class="cateTitle"></span>
            <div class="pst_m">
                <div class="aa_search">
               <span class="edit-value-outer demo1">
                      <input class="edit-value" type="text" placeholder="请选择">
                </span>
                </div>
            </div>
        </div>
        <%
            String deviceId = (String) request.getAttribute("deviceId");
            if (deviceId == null || deviceId == "" || deviceId == "null" || deviceId.equals("")) {
        %>


        <%@include file="pro_c.jsp" %>

        <%
        } else {
        %>

        <%@include file="pro_d.jsp" %>

        <%
            }
        %>

    </div>
</div>
<div class="space_hx">&nbsp;</div>
<%@include file="foot.jsp" %>
</body>
</html>
<script>
    var categoryId = '<%=(String)request.getAttribute("categoryId")%>'
    var cateName = '<%=(String)request.getAttribute("cateName")%>'
    var deviceId = '<%=(String)request.getAttribute("deviceId")%>'
    $(document).ready(
        $.ajax({
            url: '/device/find?status=NORMAL&loginCategoryId=' + loginCategoryId,
            type: 'GET',
            success: function (data) {
                if (data.list.length > 0) {
                    for (var i = 0; i < data.list.length; i++) {
                        var html = ""
                        if (deviceId == "" || deviceId == null || deviceId == 'null') {
                            var html = '<li  class="hot" id="li_' + data.list[i].id + '"  onclick="getList(' + data.list[i].id + ',\'' + data.list[i].categoryName + '\'); $(\'.cateTitle\').text(\'' + data.list[i].categoryName + '\')" ><a>' + data.list[i].categoryName + '</a></li>';

                        } else {
                            html = '<li  class="hot" id="li_' + data.list[i].id + '"  ><a href="product?num=2&categoryId=' + data.list[i].id + '&cateName=' + data.list[i].categoryName + '">' + data.list[i].categoryName + '</a></li>';
                        }
                        $("#nav_fk").append(html);
                    }
                    var url = "";
                    if (deviceId == "" || deviceId == null || deviceId == 'null') {
                        if (categoryId == null || categoryId == 'null' || categoryId == "") {
                            getList(data.list[0].id, data.list[0].categoryName);
                            $(".cateTitle").text(data.list[0].categoryName)
                        } else {
                            getList(categoryId, cateName);
                            $(".cateTitle").text(cateName)
                        }
                    } else {
                        getDetail(categoryId, deviceId, cateName)
                        $(".cateTitle").text(cateName)
                    }

                }

                search();
            }
        })
    )
    loadVisitTatol();

    function loadVisitTatol() {
        $.ajax({
            url: '/device/getVisitTotal?loginCategoryId=' + loginCategoryId,
            type: 'GET',
            success: function (data) {
                $(".visitTotal").find("li").remove();
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var li = '  <li><dl class="clearfix"><dt><a href=""><img src="' + data[i].mainImageUrl + '" alt=""/></a></dt>\n' +
                            '  <dd><div class="title"><a href="product?num=2&categoryId=' + data[i].categoryId + '&deviceId=' + data[i].id + '&cateName=' + data[i].categoryName + '">' + data[i].deviceName + '</a></div>\n' +
                            ' <div class="num">浏览次数：<em>' + data[i].visitTotal + '次</em></div> </dd>\n' +
                            '</dl></li>'
                        $(".visitTotal").append(li)
                    }
                }
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

    function searchList(searchName) {
        $.ajax({
            url: '/device/search?deviceName=' + searchName + '&pageNo=0&pageSize=4',
            type: 'GET',
            success: function (data) {
                var lilength = $("#nav_fk").find("li").length;
                if (lilength > 0) {
                    for (var i = 0; i < lilength; i++) {
                        $("#nav_fk").find("li:eq(" + i + ")").removeClass();
                        $("#nav_fk").find("li:eq(" + i + ")").addClass("hot");
                    }
                }
                $("#li_" + data.list[0].categoryId).removeClass();
                $("#li_" + data.list[0].categoryId).addClass("now");
                $(".cateTitle").text(data.list[0].cateName)
                if (data.list.length > 0) {
                    loadPage(1, data.firstPage, data.lastPage, '/device/search?deviceName=' + searchName, "searchCateList", data.list[0].categoryId, data.list[0].cateName)
                } else {
                    $(".page-no").find("a").remove();
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
                    searchList($(this).parent().find("li[class='on']").html());
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
