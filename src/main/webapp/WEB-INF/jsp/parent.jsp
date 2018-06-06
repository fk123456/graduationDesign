<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="css/reset.css"/>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/js_z.js"></script>
<script type="text/javascript" src="js/banner.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<link rel="stylesheet" type="text/css" href="css/thems.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body style="background: #FFFFFF">
<div class="t_bg">
    <div class="top">
        <%--   <div class="top_m">
               <img src="images/tel.png" class="tel" alt=""/>
           </div>
           <div class="top_m">
               <div class="search">
                   <input name="" type="text" placeholder="请输入您要搜索…">
                   <input name="" type="submit" value="">
               </div>
           </div>
           <div class="top_m">
               <a href=""><img src="images/icon1.jpg" alt=""/></a>
               <a href=""><img src="images/icon2.jpg" alt=""/></a>
               <a href=""><img src="images/icon3.jpg" alt=""/></a>
           </div>
           <div class="top_m">
               <a href="" class="lang zh on">中文</a>
               <a href="" class="lang en">Enlish</a>
           </div>--%>
    </div>
</div>
<div class="header">
    <div class="head clearfix">
        <div class="logo"><img href="images/zcmulogo.png"/></div>
        <ul class="nav clearfix">

            <li class="now"><a href="about?num=0">首 页</a></li>


            <li class="tourist"><a class="content_left" onclick="showLayer('login')">登录</a></li>
            <li class="admin_student_teacher"><a href="product?num=2">产品展示</a></li>
            <li class="lab"><a href="classShow?num=3">详细信息</a></li>
            <li class="student_teacher"><a href="stuTeaclassShow?num=4">详细信息</a></li>

            <li class="admin_student"><a href="orderList?num=5">我的预约管理</a></li>


            <li class="lab"><a href="deviceManage?num=6">学生预约仪器管理</a></li>
            <li class="lab"><a href="userManage?num=7">用户管理</a></li>
            <li class="manager"><a href="systemManager?num=8">用户管理</a></li>
            <li class="tourist"><a href="contact?num=9" class="content_right">注册</a></li>

            <li class="admin"><a class="content_left mingzi"></a></li>
            <li class="admin"><a class="content_right logoutMobile" onclick="logOut()">注销</a></li>

        </ul>
    </div>
</div>
<div id="login" class="login_layer"
     style="top: 200px; position: absolute;left: 50%;width:400px; height: 250px; border-radius:10px;">
    <div style=" margin-left:100px;margin-top:50px">
        <p style="display:inline">学号:</p>
        <input type="text" id="loginMobile" value="201612203101004"/>
    </div>
    <div style="margin-left:100px;margin-top:20px">
        <p style="display:inline">密码:</p>
        <input type="password" id="loginPassword" value="fangke555"/>
    </div>
    <div style="margin-left:100px;margin-top:20px">
        <p style="display:inline">权限:</p>
        <select class="chooseClassroom" id="selectAuthority" style="width: 157px;">
            <option value="3">学生</option>
            <option value="1">教师</option>
            <option value="0">实验室管理员</option>
            <option value="2">系统管理员</option>
        </select>
    </div>
    <div style="margin-top:20px">
        <div style=" text-align:center;margin-top:20px">
            <input class="button" type="button" value="登录" onclick="login()"
                   style="margin-right:50px; padding:5px 15px;color: #FFFFFF; background:#3B8AFF; border-radius:3px; border:#00A3FF 1px solid;"/>
            <input class="button" type="button" value="取消" onclick="hideLayer('login')"
                   style="padding:5px 15px; background:#3B8AFF;color: #FFFFFF; border-radius:3px; border:#00A3FF 1px solid;"/>
        </div>
    </div>
</div>
</body>
</html>
<script>
    var loginName = '<%=request.getSession().getAttribute("loginName")%>';
    var loginId = '<%=request.getSession().getAttribute("loginId")%>';
    var loginAccount = '<%=request.getSession().getAttribute("loginAccount")%>';
    var loginAuthority = '<%=request.getSession().getAttribute("loginAuthority")%>';
    var loginCategoryId = '<%=request.getSession().getAttribute("loginCategoryId")%>';
    if (loginName != 'null') {
        $(".mingzi").text(loginName);
        $(".tourist").hide();
        $(".admin").show();
        if (loginAuthority == '1') {//教师
            $(".student").hide();
            $(".admin_student_teacher").show();
            $(".admin_student").hide();
            $(".student_teacher").show();
            $(".manager").hide();
            $(".lab").hide();
        } else if (loginAuthority == '3') {//学生
            $(".student").show();
            $(".admin_student_teacher").show();
            $(".admin_student").show();
            $(".student_teacher").show();
            $(".manager").hide();
            $(".lab").hide();
        } else if (loginAuthority == '2') {//系统管理员
            $(".student").hide();
            $(".admin_student_teacher").hide();
            $(".admin_student").hide();
            $(".student_teacher").hide();
            $(".manager").show();
            $(".lab").hide();
        } else if (loginAuthority == '0') {//实验室管理员
            $(".lab").show();
            $(".admin_student_teacher").show();
            $(".student_teacher").hide();
            $(".admin_student").show();
            $(".student").hide();
            $(".manager").hide();
        }
    } else {
        $(".tourist").show();
        $(".student").hide();
        $(".manager").hide();
        $(".lab").hide();
        $(".student_teacher").hide();
        $(".admin_student").hide();
        $(".admin_student_teacher").hide();
        $(".admin").hide();
        var num =
        <%=request.getParameter("num")%>
        if (num != 0 && num != 9) {
            window.location.href = "/about?num=0";
        }
    }


    $(document).ready(function () {
        var num = <%=request.getParameter("num")%>
            now(num);

    });


    function register() {
        var certificateId = $("#certificateId").val();
        var password = $("#password").val();
        var name = $("#name").val();
        //var sex=$(".sex").val();
        //var age=$("#age").val();
        var mobile = $("#mobile").val();
        //var email=$("#email").val();
        //var address=$("#address").val();
        //var depart=$("#depart").val();
        //var grade=$("#grade").val();
        var cardId = $("#cardId").val();

        var value = {
            certificateId: certificateId,
            password: password,
            name: name,
            //sex:sex,
            //age:age,
            mobile: mobile,
            //email:email,
            //address:address,
            //depart:depart,
            //grade:grade,
            cardId: cardId
        };
        var data = JSON.stringify(value);
        $.ajax({
            url: "/user/register",
            type: "POST",
            data: data,
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            success: function (data) {
                if (data.info.result == "1") {
                    layer.open({
                        content: '验证成功,直接登录！！！',
                        scrollbar: false,
                        register: true
                    });

                } else {
                    layer.open({
                        content: data.info.error.message,
                        scrollbar: false,
                    });
                }
            }
        })
    }

    function login() {
        var mobile = $("#loginMobile").val();
        var password = $("#loginPassword").val();
        var authority = $("#selectAuthority").val();
        var name = $("#name").val();
        $.ajax({
            url: '/user/login?mobile=' + mobile + '&password=' + password + '&authority=' + authority,
            type: 'GET',
            success: function (data) {
                if (data.info.result == "1") {
                    layer.open({
                        content: '登录成功',
                        scrollbar: false,
                        flag: true
                    });
                    hideLayer('login');
                    if (data.info.data.authority == 1) {
                        $(".tourist").hide();
                        $(".student").hide();
                        $(".admin").show();
                        $(".admin_student").show();
                    } else if (data.info.data.authority == 0) {
                        $(".tourist").hide();
                        $(".student").show();
                        $(".admin").hide();
                        $(".admin_student").show();
                    }
                    $(".mingzi").text(data.info.data.name);
                } else if (data.info.result == "0") {
                    layer.open({
                        content: data.info.error.message,
                        scrollbar: false,
                    });
                }
            }
        })
    }

    function logOut() {
        var mobile = $(".logoutMobile").val();
        $.ajax({
            url: '/user/logout?mobile=' + mobile,
            type: 'GET',
            success: function (data) {
                if (data.result == '1') {
                    layer.open({
                        content: '注销成功',
                        scrollbar: false,
                        flag: true
                    });

                }
            }
        })
    }


    function now(num) {
        var nav = $(".nav").find("li")
        for (var i = 0; i < nav.length; i++) {
            nav.eq(i).removeClass("now");
        }
        nav.eq(num).addClass("now");
    }
</script>


