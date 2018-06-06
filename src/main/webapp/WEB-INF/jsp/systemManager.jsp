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
            <table width="100%" class="table">

                <col width="4%"></col>
                <col width="8%"></col>
                <col width="10%"></col>
                <col width="10%"></col>
                <col width="17%"></col>
                <col width="13%"></col>
                <col width="10%"></col>
                <col width="10%"></col>
                <col width="10%"></col>
                </colgroup>
                <tr>
                    <input type="button" id="add" onclick="showLayer('addUser')" value="添加用户"/>
                </tr>
                <tr>
                    <th>ID</th>
                    <th>学号</th>
                    <th>类别</th>
                    <th>状态</th>
                    <th>学院</th>
                    <th>姓名</th>
                    <th>职称</th>
                    <th>办公室</th>
                    <th>账号是否禁用</th>
                </tr>

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
            <option value="1">教师</option>
            <option value="0">实验室管理员</option>
        </select>
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
        url: '/user/getAllUser',
        type: 'GET',
        success: function (result) {
            if (result.data.length > 0) {
                var user = result.data;

                for (var i = 0; i < user.length; i++) {
                    var html = ''
                    if (i % 2 == 1) {
                        html += '<tr>';
                    } else {
                        html += '<tr class="alter">';
                    }
                    html += '                 <td>' + user[i].id + '</td>\n' +
                        '                    <td>' + user[i].account + '</td>\n';
                    if (user[i].authority == 0) {
                        html += '                    <td>实验室管理员</td>\n';
                    }
                    if (user[i].authority == 1) {
                        html += '                    <td>教师</td>\n';
                    }
                    html += '                    <td>' + user[i].status + '</td>\n' +
                        '                    <td>' + user[i].categoryName + '</td>\n' +
                        '                    <td>' + user[i].name + '</td>\n' +
                        '                    <td>' + user[i].title + '</td>\n' +
                        '                    <td>' + user[i].office + '</td>\n'
                    if (user[i].status == "UN_NORMAL") {
                        html += '<td><select onchange="changeUserState(' + user[i].id + ',this)"><option value="UN_NORMAL">未启用</option ><option value="NORMAL">已启用</option><option value="DISABLE">已禁用</option></select></td></tr>\n'
                    }
                    if (user[i].status == "NORMAL") {
                        html += '<td><select onchange="changeUserState(' + user[i].id + ',this)"><option value="NORMAL">已启用</option><option value="DISABLE">已禁用</option></select></td></tr>\n'
                    }
                    if (user[i].status == "DISABLE") {
                        html += '<td><select onchange="changeUserState(' + user[i].id + ',this)"><option value="DISABLE">已禁用</option><option value="NORMAL">已启用</option></select></td></tr>\n'
                    }
                    $(".table").append(html);
                }


            }
        }
    })

    function addUser() {
        var id = $("#id").val();
        var account = $("#addAccount").val();
        var password = $("#addPassword").val();
        var authority = $("#addAuthority").val();
        var categoryId = $("#addCategory").val();
        var name = $("#addName").val();
        var title = $("#addTitle").val();
        var office = $("#addOffice").val();

        var value = {
            id: id,
            account: account,
            password: password,
            authority: authority + "",
            status: 'NORMAL',
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
                        system: true
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
