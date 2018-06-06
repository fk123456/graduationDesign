<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
    <link rel="stylesheet" type="text/css" href="css/contact.css">

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

    <div class="scd_r" style="width: 100%">
        <div class="pst">
            <span>注册</span>

        </div>
        <div align="center">
            <div class="content">
                <img src="images/telephone.jpg" alt="">


                <div align="center" style="margin-top: 30px;">
                    <label for="name"> <span class="same-width-l">学号：</span>
                        <input type="text" name="first" class="same-width-r" id="certificateId">
                    </label>
                </div>
                <div align="center">
                    <label for="password"> <span class="same-width-l">密码：</span>
                        <input type="password" id="password" class="same-width-r">
                    </label>
                </div>
                <div align="center">
                    <label for="name"> <span class="same-width-l">姓名：</span>
                        <input type="text" id="name" class="same-width-r">
                    </label>
                </div>
                <%--<div align="center">--%>
                <%--<label for="name"> <span class="same-width-l">性别：</span>--%>
                <%--<span style="width: 200px;float: right;text-align: left"><input checked type="radio" name="sex"  value="男" class="sex">男  <input type="radio"  value="女" name="sex"  class="sex" >女</span>--%>
                <%--</label>--%>
                <%--</div>--%>
                <div align="center">
                    <label for="name"> <span class="same-width-l">身份证后六位：</span>
                        <input type="text" id="cardId" class="same-width-r">
                    </label>
                </div>
                <div align="center">
                    <label for="mobile"> <span class="same-width-l">手机号：</span>
                        <input type="text" id="mobile" class="same-width-r">
                    </label>
                </div>

                <%--<div align="center">--%>
                <%--<label for="email"> <span class="same-width-l">电子邮件：</span>--%>
                <%--<input type="text" id="email" class="same-width-r">--%>
                <%--</label>--%>
                <%--</div>--%>
                <%--<div align="center">--%>
                <%--<label for="address"> <span class="same-width-l">宿舍：</span>--%>
                <%--<input type="text"  id="address" class="same-width-r">--%>
                <%--</label>--%>
                <%--</div>--%>
                <%--<div align="center">--%>
                <%--<label for="depart"> <span class="same-width-l">学院：</span>--%>
                <%--<input type="text"  id="depart" class="same-width-r">--%>
                <%--</label>--%>
                <%--</div>--%>
                <%--<div align="center">--%>
                <%--<label for="grade"> <span class="same-width-l">年级：</span>--%>
                <%--<input type="text"  id="grade" class="same-width-r">--%>
                <%--</label>--%>
                <%--</div>--%>
                <%--<div align="center">--%>
                <%--<label for="theClass"> <span class="same-width-l">班级：</span>--%>
                <%--<input type="text"  id="theClass" class="same-width-r">--%>
                <%--</label>--%>
                <%--</div>--%>
                <div align="center">
                    <input type="button" value="注 册" class="move"
                           style="width: 115px;text-align: center; font-size: 20px; padding:5px 15px;color: #FFFFFF; background:#3B8AFF; border-radius:3px; border:#00A3FF 1px solid;"
                           onclick="register()" id="submit">
                </div>

            </div>
        </div>
    </div>
</div>
<div class="space_hx">&nbsp;</div>
<%@include file="foot.jsp" %>
</body>
</html>
