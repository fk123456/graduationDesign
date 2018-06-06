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
                <col width="7%"></col>
                <col width="14%"></col>
                <col width="26%"></col>
                <col width="10%"></col>
                <col width="8%"></col>
                <col width="8%"></col>
                <col width="14%"></col>
                <col width="9%"></col>
                </colgroup>
                <tr>
                    <th>ID</th>
                    <th>姓名</th>
                    <th>学号</th>
                    <th>邮箱</th>
                    <th>手机</th>
                    <th>身份证号</th>
                    <th>状态</th>
                    <th>院系</th>
                    <th>账号是否禁用</th>
                </tr>

            </table>
        </div>
    </div>
</div>
<div class="space_hx">&nbsp;</div>
<%@include file="foot.jsp" %>
</body>
</html>


<script>
    $.ajax({
        url: '/user/getUserInfo?categoryId=' + loginCategoryId,
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
                        '                    <td>' + user[i].name + '</td>\n' +
                        '                    <td>' + user[i].certificateId + '</td>\n' +
                        '                    <td>' + user[i].email + '</td>\n' +
                        '                    <td>' + user[i].mobile + '</td>\n' +
                        '                    <td>' + user[i].cardId + '</td>\n' +
                        '                    <td>' + user[i].status + '</td>\n' +
                        '                    <td>' + user[i].categoryName + '</td>\n'
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

    function changeUserState(userId, $this) {
        var status = $($this).val();
        $.ajax({
            url: '/user/changeUserStateOnStudent?userId=' + userId + '&status=' + status,
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
