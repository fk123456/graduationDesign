<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

    <script src="js/index.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/angular.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body ng-app>
<%@include file="parent.jsp" %>
<div style="margin-left:auto; margin-right:auto; width:600px; padding-top:30px">

</div>

<div ng-controller="cartController" class="container">
    <table class="table" ng-show="cart.length">
        <thead>
        <tr>
            <th>订单编号</th>
            <th>预订设备</th>
            <th>预订实验室</th>
            <th>预订时间</th>
            <th>预订课时</th>
            <th>预订数量</th>
            <th>预订状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr ng-repeat="item in cart| filter:abc">
            <td ng-bind="item.id"></td>
            <td ng-bind="item.deviceName"></td>
            <td ng-bind="item.classroom"></td>
            <td ng-bind="item.appointTime"></td>
            <td ng-bind="item.course"></td>
            <td>
                <button type="button" ng-click="reduce(item.id)" class="btn btn-primary btn-sm">-</button>
                <input type="text" ng-change="book(item.id)" ng-model="item.book" style="text-align: center;">
                <button type="button" ng-click="add(item.id)" class="btn btn-primary btn-sm">+</button>
            </td>
            <td ng-bind="item.stateInfo" ng-init="stateInfo(item.id)"></td>
            <td>
                <button type="button" ng-click="cancle(item.id)" class="btn btn-danger btn-sm" style="color: #fff;">
                    取消预订
                </button>
                <button type="button" ng-click="confirm(item.id)" style="color: #fff;margin-left: 10px;"
                        class="btn btn-danger btn-sm">确认修改
                </button>
            </td>
        </tr>
        <%--	<tr>
                <td>总购物价</td>
                <td ng-bind="totalPrice()"></td>
                <td>总购买数量</td>
                <td ng-bind="totalQuantity()"></td>
                <td colspan="2"><button type="button"  ng-click="cart = {}" class="btn btn-danger btn-sm">清空购物车</button></td>
            </tr>--%>
        </tbody>
    </table>

    <p ng-show="!cart.length">未预约仪器</p>

    <div class="space_hx">&nbsp;</div>
    <div class="pages">
        <span class="page-no"></span>
    </div>
</div>

<%@include file="foot.jsp" %>
</body>
</html>

