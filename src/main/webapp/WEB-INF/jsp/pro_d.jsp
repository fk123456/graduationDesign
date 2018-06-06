<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="plugins/pro/js/lib.js"></script>
<script type="text/javascript" src="plugins/pro/js/zzsc.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml">

<body>

<%--<div class="pst">
    <span class="cateName"></span>
    <div class="pst_m">
        <div class="r_search">
            <input name="" type="text" placeholder="请输入关键字">
            <input name="" type="submit" value="搜 索">
        </div>
    </div>
</div>--%>
<div class="scd_m">
    <div class="pro_d">
        <div class="pro_da clearfix">
            <div class="pro_dal">
                <div id="preview">
                    <div class="jqzoom" id="spec-n1" onClick=""><img height=260 id="mainImg"
                                                                     width=350>
                        <i>&nbsp;</i>
                    </div>
                    <div id="spec-n5">
                        <div id="spec-list">
                            <ul class="list-h">
                                <%--      <li><img onmouseover="over(this)" onmouseout="out(this)"  src="upload/pic4.jpg"></li>
                                      <li><img onmouseover="over(this)" onmouseout="out(this)" src="upload/pic3.jpg"></li>
                                      <li><img onmouseover="over(this)" onmouseout="out(this)" src="upload/pic2.jpg"></li>
                                      <li><img onmouseover="over(this)" onmouseout="out(this)" src="upload/pic3.jpg"></li>
                                      <li><img onmouseover="over(this)" onmouseout="out(this)" src="upload/pic2.jpg"></li>
                            --%> </ul>
                        </div>

                    </div>
                </div>
                <script type=text/javascript>
                    $(function () {
                        $(".jqzoom").jqueryzoom({
                            xzoom: 350,
                            yzoom: 350,
                            offset: 10,
                            position: "right",
                            preload: 1,
                            lens: 1
                        })
                    })
                    $(function () {

                        $("#spec-list").jdMarquee({
                            deriction: "left",
                            width: 350,
                            height: 85,
                            step: 2,
                            speed: 4,
                            delay: 10,
                            control: true,
                            _front: "#spec-right",
                            _back: "#spec-left"
                        });

                    })

                    function over($this) {
                        var src = $($this).attr("src");
                        $("#spec-n1 img").eq(0).attr({
                            src: src.replace("\/n5\/", "\/n1\/"),
                            jqimg: src.replace("\/n5\/", "\/n0\/")
                        });
                        $($this).css({
                            "border": "1px solid #008BDA",
                        });
                    }

                    function out($this) {
                        $($this).css({
                            "border": "1px solid #eee",
                        });
                    };
                </script>

            </div>

            <div class="pro_dar">
                <h1 class="deviceName"></h1><span class="classroomNo"></span> <br> <span class="visitTotal1"></span>

                <div class="des">
                    <p><b>设备描述：</b><span class="deviceDescribe"></span></p>
                </div>
                <div>
                    <div><input type="text" class="demo-input appointTime" placeholder="请选择预约日期" id="test1">
                    </div>

                    <div class="ant-same-style"><b>预约设备数量：</b>&emsp;
                        <input type="number" class="orderNum" onchange="rangeOfValue(this)">可预约设备：<span
                                class="inventory"></span>
                    </div>
                    <div class="ant-same-style chooseClassNo">
                        <b>选择课时：(教学使用设备器材时间不可预约)</b>
                        <br>
                        <a class="selectNormal" classNo="1" onclick="getClass(this)">第一节课-第二节课</a>
                        <a class="selectNormal" classNo="2" onclick="getClass(this)">第三节课-第四节课</a>
                        <br>
                        <a class="selectNormal" classNo="3" onclick="getClass(this)">第五节课-第六节课</a>
                        <a class="selectNormal" classNo="4" onclick="getClass(this)">第七节课-第八节课</a>
                    </div>
                </div>
                <div>
                    <div class="r_order" style="width: 115px; float: left"><a class="green"
                                                                              onclick="appointment()"><span>立即预约</span></a>
                        <a class="gray"><span>立即预定</span></a></div>
                    <span class="orderInfo"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="space_hx">&nbsp;</div>
    <%-- <div class="pro_dm">
         <div class="tabBox_t">
             <div class="tabBox">
                 <ul class="tabNav clearfix">
                     <li class="a now"><span>兼容模型</span></li>
                     <li class="b"><span>不同类型</span></li>
                     <li class="c"><span>价格</span></li>
                 </ul>
                 <div class="tabCont a_ctn" style="display:block;">
                     <!--商品介绍-->
                     <p>【产品名称】安科一体成人指套探头</p>
                     <p>【规格型号】U471-2BL</p>
                     <p>【注册证编号】粤械注准20142210280</p>
                     <p>【适用机器】安保</p>
                     <p>【机器端】单槽，6针</p>
                     <p>【病人端】成人指夹/指套式、儿童指夹/指套式、新生儿捆绑</p>
                     <img src="upload/pic11.jpg" width="499" height="207" alt=""/>
                 </div>
                 <div class="tabCont b_ctn">
                     不同类型
                 </div>
                 <div class="tabCont c_ctn">
                     价格
                 </div>
             </div>
         </div>
     </div>--%>
    <div class="space_hx">&nbsp;</div>
    <div class="relative">
        <div class="r_title"><span>相关产品</span></div>
        <ul class="clearfix otherDevice">

        </ul>
    </div>
</div>

</body>
</html>
<script>

    function getDetail(categoryId, deviceId, cateName) {
        $(".aa_search").hide();
        var lilength = $("#nav_fk").find("li").length;
        if (lilength > 0) {
            for (var i = 0; i < lilength; i++) {
                $("#nav_fk").find("li:eq(" + i + ")").removeClass();
                $("#nav_fk").find("li:eq(" + i + ")").addClass("hot");
            }
        }
        $("#li_" + categoryId).removeClass();
        $("#li_" + categoryId).addClass("now");

        $.ajax({
            url: '/device/details?deviceId=' + deviceId + '&categoryId=' + categoryId,
            type: 'GET',
            success: function (result) {
                if (result != undefined) {
                    $(".deviceName").text(result.device.deviceName);
                    $(".visitTotal1").text("浏览次数：" + result.device.visitTotal + "次");
                    $(".classroomNo").text("实验室：" + result.device.classroomNo);

                    $(".deviceDescribe").text(result.device.description)
                    $("#mainImg").attr("src", result.device.mainImageUrl);
                    $("#mainImg").attr("jqimg", result.device.mainImageUrl);
                    load(deviceId, result.device.total);
                    var mallImg = result.mallImg;
                    for (var i = 0; i < mallImg.length; i++) {
                        var html = '                                <li><img onmouseover="over(this)" onmouseout="out(this)"  src="' + mallImg[i].url + '"></li>\n'
                        $(".list-h").append(html);
                    }
                    var deviceList = result.deviceList;
                    for (var i = 0; i < deviceList.length; i++) {
                        var html = '<li><a href="product?num=2&categoryId=' + deviceList[i].categoryId + '&deviceId=' + deviceList[i].id + '&cateName=' + deviceList[i].categoryName + '"><img src="' + deviceList[i].mainImageUrl + '" alt=""/><p>' + deviceList[i].deviceName + '</p> </a></li>'
                        $(".otherDevice").append(html);
                    }
                    loadVisitTatol();
                }
            }
        })


    }

    function getClass($this) {
        var classNo;
        var chooseClassNo = $(".chooseClassNo").find("a");
        for (var i = 0; i < chooseClassNo.length; i++) {
            if (!$($this).hasClass("selectNo")) {
                if (chooseClassNo.eq(i).hasClass("selectNow")) {
                    chooseClassNo.eq(i).removeClass("selectNow")
                    chooseClassNo.eq(i).addClass("selectNormal");
                }
            }

        }
        if ($($this).hasClass("selectNormal")) {
            $($this).removeClass("selectNormal")
            $($this).addClass("selectNow");
            classNo = $($this).attr("classNo");
            var time = $("#test1").val();
            selectClass(time, classNo);
        }

    }

    function putGray(num) {
        num = num - 1;
        var chooseClassNo = $(".chooseClassNo").find("a");
        chooseClassNo.eq(num).removeClass("selectNormal")
        chooseClassNo.eq(num).removeClass("selectNow")
        chooseClassNo.eq(num).addClass("selectNo");
        chooseClassNo.eq(num).text("教学安排")

    }

    function putBlue(num) {
        num = num - 1;
        var chooseClassNo = $(".chooseClassNo").find("a");
        chooseClassNo.eq(num).removeClass("selectNormal")
        chooseClassNo.eq(num).removeClass("selectNo")
        chooseClassNo.eq(num).addClass("selectNow");

    }

    function put() {
        var chooseClassNo = $(".chooseClassNo").find("a");
        chooseClassNo.eq(0).text("第一节课-第二节课")
        chooseClassNo.eq(1).text("第三节课-第四节课")
        chooseClassNo.eq(2).text("第五节课-第六节课")
        chooseClassNo.eq(3).text("第七节课-第八节课")
        chooseClassNo.eq(0).removeClass("selectNo")
        chooseClassNo.eq(1).removeClass("selectNo")
        chooseClassNo.eq(2).removeClass("selectNo")
        chooseClassNo.eq(3).removeClass("selectNo")
        chooseClassNo.eq(0).removeClass("selectNow")
        chooseClassNo.eq(1).removeClass("selectNow")
        chooseClassNo.eq(2).removeClass("selectNow")
        chooseClassNo.eq(3).removeClass("selectNow")
        chooseClassNo.eq(0).removeClass("selectNormal")
        chooseClassNo.eq(1).removeClass("selectNormal")
        chooseClassNo.eq(2).removeClass("selectNormal")
        chooseClassNo.eq(3).removeClass("selectNormal")
        chooseClassNo.eq(0).addClass("selectNormal")
        chooseClassNo.eq(1).addClass("selectNormal")
        chooseClassNo.eq(2).addClass("selectNormal")
        chooseClassNo.eq(3).addClass("selectNormal")
    }
</script>

<script>
    var theDeviceId;
    var theSum;

    function load(devideId, total) {
        theDeviceId = devideId;
        theSum = total;
        var myDate = new Date();
        //获取当前年
        var year = myDate.getFullYear();
        //获取当前月
        var month = myDate.getMonth() + 1;
        //获取当前日
        var date = myDate.getDate();
        var h = myDate.getHours();       //获取当前小时数(0-23)
        var m = myDate.getMinutes();     //获取当前分钟数(0-59)
        var s = myDate.getSeconds();

        var now = year + '-' + month + "-" + date;
        //限定可选日期
        laydate.render({
            elem: '#test1',
            min: now,
            value: now
        });
        getReserveInfo(now)
        if (loginAuthority == 1) {
            $(".r_order").hide();
        } else {
            grayShow();
        }

    }

    function grayShow() {
        $(".r_order").find(".gray").show();
        $(".r_order").find(".green").hide();
    }

    function greenShow() {
        $(".r_order").find(".green").show();
        $(".r_order").find(".gray").hide();
    }

    function getReserveInfo(time) {
        if (time == '') {
            time = $("#test1").val();
        }
        loadClass(time);
        /* $.ajax({
             url: '/order/loadClassRoom',
             type: 'GET',
             success: function (result) {
                 var classroom=result.classroom;
                 var options='';
                 if(classroom.length>0){
                     for(var i=0;i<classroom.length;i++){
                         options+='<option value="'+classroom[i].id+'">'+classroom[i].classroomNo+'</option>'
                     }
                     $(".chooseClassroom").append(options);
                 }
             }
         })*/
    }

    function rangeOfValue($this) {
        if (loginAuthority != 1) {//老师
            var value = $($this).val()
            if (value == "" || value == undefined || !value.match("^\\d+$") || $(".inventory").text() == "无") {
                grayShow();
            } else {
                if ((parseInt(value) < 1 || parseInt(value) > parseInt($(".inventory").text()))) {
                    grayShow();
                } else {
                    greenShow();
                }
            }
        } else {
            $(".r_order").hide();
        }

    }

    function loadClass(time) {
        $.ajax({
            url: '/order/loadClass?appointTime=' + time + '&deviceId=' + theDeviceId + '&sum=' + theSum,
            type: 'GET',
            success: function (result) {
                put();
                var all = result.all;
                for (var i = 0; i < all.length; i++) {
                    if (all[i][1] == 0) {

                    } else if (all[i][1] == 1) {
                        putGray(all[i][0]);
                    }
                }
                if (result.first == 0) {
                    $(".inventory").text("无");
                    grayShow();
                } else {
                    putBlue((result.first))
                    $(".inventory").text(result.inventory + "台");
                }

            }
        })
    }

    function selectClass(time, classNo) {
        $.ajax({
            url: '/order/selectClass?appointTime=' + time + '&deviceId=' + theDeviceId + '&sum=' + theSum + '&classNo=' + classNo,
            type: 'GET',
            success: function (result) {
                $(".inventory").text(result.inventory + "台");
            }
        })
    }

    function appointment() {
        var appointTime = $(".appointTime").val();
        var orderNum = $(".orderNum").val();
        var chooseClassNo = $(".chooseClassNo").find("a");
        var classNo;
        if (chooseClassNo.length > 0) {
            for (var i = 0; i < chooseClassNo.length; i++) {
                if (chooseClassNo.eq(i).hasClass("selectNow")) {
                    classNo = chooseClassNo.eq(i).attr("classNo");
                }
            }
        }

        $.ajax({
            url: '/order/appointment?deviceId=' + theDeviceId + '&authority=' + loginAuthority + '&classNo=' + classNo + '&userId=' + loginId + '&book=' + orderNum + '&appointTime=' + appointTime,
            type: 'GET',
            success: function (result) {
                $(".orderNum").val("");
                if (result.data == "success") {
                    var info = ""
                    if (loginAuthority == 3) {
                        info = "预约成功,等待实验室管理员同意方可使用"
                    } else if (loginAuthority == 0) {
                        info = "预约成功，可直接使用"
                    }
                    layer.open({
                        content: info,
                        scrollbar: false,
                    });
                    var time = $("#test1").val();
                    selectClass(time, classNo)
                } else if (result.data.error = "error") {
                    layer.open({
                        content: "预订失败！",
                        scrollbar: false,
                    });
                }
            }
        })
    }
</script>