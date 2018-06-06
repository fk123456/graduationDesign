<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" type="text/css" href="css/my.css">
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
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

    <div class="scd_r" style="width: 100%;min-height: 350px">
        <div class="pst">
            <span>用户管理</span>
            <div class="pst_m">

            </div>
        </div>
        <div class="scd_m">
            <%-- 学号 姓名 性别 年龄  邮箱 宿舍  年级 院系 班级--%>
            <select class="myAllDevice" id="selectAuthority" onchange="wait()" style="width: 157px;">

            </select>
            <table id="myId" width="100%" class="table">

            </table>
        </div>
    </div>
</div>
<div id="addUser" class="login_layer"
     style="top: 200px; position: absolute;left: 50%;width:400px; height: 450px; border-radius:10px;">
    <div style=" margin-left:100px;margin-top:50px">
        <p style="display:inline">账号:</p>
        <input type="text" id="addAccount" value="10086"/>
    </div>
    <div style="margin-left:100px;margin-top:20px">
        <p style="display:inline">密码:</p>
        <input type="password" id="addPassword" value="111111"/>
    </div>
    <div style="margin-left:100px;margin-top:20px">
        <p style="display:inline">权限:</p>
        <select class="chooseClassroom" id="addAuthority" style="width: 157px;">
            <option value="教师">教师</option>
            <option value="实验室管理员">实验室管理员</option>
        </select>
    </div>
    <div style="margin-left:100px;margin-top:20px">
        <p style="display:inline">是否启用:</p>
        <input type="text" id="addStatus" value="NORMAL"/>
    </div>
    <div style="margin-left:100px;margin-top:20px">
        <p style="display:inline">学院:</p>
        <select class="chooseClassroom" id="addCategory" style="width: 157px;">
            <option value="1">动物实验研究中心</option>
            <option value="2">基础医学院</option>
            <option value="3">科研处</option>
            <option value="4">骨伤研究所</option>
            <option value="5">第三临床医学院</option>
            <option value="6">生物工程学院</option>
            <option value="7">药学院</option>
            <option value="8">药物研究所</option>
            <option value="9">生命科学学院</option>
            <option value="10">第一临床医学院</option>
        </select>
    </div>
    <div style="margin-left:100px;margin-top:20px">
        <p style="display:inline">名字:</p>
        <input type="text" id="addName"/>
    </div>
    <div style="margin-left:100px;margin-top:20px">
        <p style="display:inline">职称:</p>
        <input type="text" id="addTitle" value="教授"/>
    </div>
    <div style="margin-left:100px;margin-top:20px">
        <p style="display:inline">办公室:</p>
        <input type="text" id="addOffice" value="6-000"/>
    </div>
    <div style="margin-top:20px">
        <div style=" text-align:center;margin-top:20px">
            <input class="button" type="button" value="添加" onclick="addUser()"
                   style="margin-right:50px; padding:5px 15px;color: #FFFFFF; background:#3B8AFF; border-radius:3px; border:#00A3FF 1px solid;"/>
            <input class="button" type="button" value="取消" onclick="hideLayer('addUser')"
                   style="padding:5px 15px; background:#3B8AFF;color: #FFFFFF; border-radius:3px; border:#00A3FF 1px solid;"/>
        </div>
    </div>
</div>
<div class="space_hx">&nbsp;</div>
<%@include file="foot.jsp" %>
</body>
</html>


<script>
    $.ajax({
        url: '/user/getAllByDeviceId?categoryId=' + loginCategoryId,
        type: 'GET',
        success: function (result) {
            if (result.data.length > 0) {
                var all = result.data;
                var opt = '';
                for (var i = 0; i < all.length; i++) {
                    opt += '<option value="' + all[i].id + '">' + all[i].deviceName + '</option>';
                }
                $(".myAllDevice").append(opt)
                wait();
            }
            // <option value="3">学生</option>
        }
    })


    function wait() {
        var deviceId = $(".myAllDevice").val();
        $.ajax({
            url: '/user/getAllOrder?categoryId=' + loginCategoryId + '&deviceId=' + deviceId,
            type: 'GET',
            success: function (result) {
                $("#myId").find("tr").remove();
                if (result.data.length > 0) {
                    var user = result.data;
                    var htm = '<tr><td></td>'
                    for (var k = 0; k < user.length; k++) {
                        htm += '<td class="width=14%">' + user[k].time + user[k].week + '</td>\n';
                    }
                    htm += '</tr>'
                    $("#myId").append(htm)
                    var one = '<tr><td>第一节课-第二节课</td>'
                    for (var k = 0; k < user.length; k++) {
                        if (user[k].one != null) {
                            one += '<td class="width=14%">' + user[k].one + '</td>\n';
                        } else {
                            one += '<td class="width=14%"></td>\n';
                        }
                    }
                    one += '</tr>'
                    $("#myId").append(one)
                    var two = '<tr><td>第三节课-第四节课</td>'
                    for (var k = 0; k < user.length; k++) {
                        if (user[k].two != null) {
                            two += '<td class="width=14%">' + user[k].two + '</td>\n';
                        } else {
                            two += '<td class="width=14%"></td>\n';
                        }
                    }
                    two += '</tr>'
                    $("#myId").append(two)
                    var three = '<tr><td>第五节课-第六节课</td>'
                    for (var k = 0; k < user.length; k++) {
                        if (user[k].three != null) {
                            three += '<td class="width=14%">' + user[k].three + '</td>\n';
                        } else {
                            three += '<td class="width=14%"></td>\n';
                        }
                    }
                    three += '</tr>'
                    $("#myId").append(three)
                    var four = '<tr><td>第七节课-第八节课</td>'
                    for (var k = 0; k < user.length; k++) {
                        if (user[k].four != null) {
                            four += '<td class="width=14%">' + user[k].four + '</td>\n';
                        } else {
                            four += '<td class="width=14%"></td>\n';
                        }
                    }
                    four += '</tr>'
                    $("#myId").append(four)


                }
            }
        })
    }


    function addUser() {
        var id = $("#id").val();
        var account = $("#addAccount").val();
        var password = $("#addPassword").val();
        var authority = $("#addAuthority").val();
        var status = $("#addStatus").val();
        var categoryId = $("#addCategory").val();
        var name = $("#addName").val();
        var title = $("#addTitle").val();
        var office = $("#addOffice").val();

        var value = {
            id: id,
            account: account,
            password: password,
            authority: authority,
            status: status,
            categoryId: categoryId,
            name: name,
            title: title,
            office: office
        };
        var data = JSON.stringify(value);
        $.ajax({
            url: "/user/addUser",
            type: "POST",
            data: data,
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            success: function (data) {
                if (data.result == "1") {
                    layer.open({
                        content: '添加成功',
                    });
                    hideLayer('addUser');
                } else {
                    layer.open({
                        content: data.error.message,
                    });
                }
            }
        })
    }

    function changeUserState(userId, $this) {
        var status = $($this).val();
        $.ajax({
            url: '/user/changeUserState?userId=' + userId + '&status=' + status,
            type: 'GET',
            success: function (result) {
                if (result.data == "success") {
                    layer.open({
                        content: "修改状态成功",
                        scrollbar: false,
                    });
                } else {
                    layer.open({
                        content: "修改状态失败",
                        scrollbar: false,
                    });
                }

            }

        })
    }
</script>
