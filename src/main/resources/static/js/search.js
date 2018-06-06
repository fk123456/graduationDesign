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
                        var word = "^" + $(dom).val() + ".*";
                        var liNum = 0;
                        for (var i = 0; i < proposals.length; i++) {
                            if (proposals[i].match(word)) {
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