<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <title>优品医疗</title>
</head>

<body>
<!--头部-->
<%@include file="parent.jsp" %>
<div class="scd clearfix">
    <div class="scd_r" style="width: 100%;min-height: 450px;">

        <div class="scd_m">
            <div class="g-page g-question" id="container">

                <div class="m-body">
                    <ul id="ul">

                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>
<%@include file="foot.jsp" %>
</body>
</html>

<script>
    $.ajax({
        url: '/user/getMessage?userId=' + loginId,
        type: 'GET',
        success: function (result) {
            if (result.length > 0) {
                for (var i = 0; i < result.length; i++) {
                    var html = ' <li>\n' +
                        ' <img src="images/people.png"  class="m-robot-icon"><span class="m-robot-msg">' + result[i].message + '</span>\n' +
                        '</li>'
                    $("#ul").append(html);
                }
            }
        }
    })
</script>
