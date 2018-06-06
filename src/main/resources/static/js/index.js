var cartController = function ($scope) {
    function aa() {
        var list;
        $.ajax({
            url: '/order/getOrderList?userId=' + loginId + '&pageNo=1&pageSize=1000000&authority=' + loginAuthority + '&account=' + loginAccount,
            type: 'GET',
            async: false,
            success: function (result) {
                list = result.list;
            }
        })
        return list;
    }

    $scope.cart = aa();

    //找一个项目
    $scope.findItem = function (id) {
        var index = -1;
        angular.forEach($scope.cart, function (item, key) {
            if (item.id === id) {
                index = key;
                return;
            }
            ;
        });
        return index;
    };

    $scope.cancle = function (id) {
        var index = $scope.findItem(id);
        if (index !== -1) {
            if ($(".table").find("tbody").find("tr").eq(index).find("td:last").find("button").attr("ng-disabled") == "true") {
                $.ajax({
                    url: '/order/updateState?deleteId=' + loginAccount + '&id=' + id,
                    type: 'GET',
                    success: function (result) {
                        if (result.data == "success") {
                            layer.open({
                                content: "取消预约成功！",
                                scrollbar: false,
                                my: true
                            });
                        }

                    }
                })
            }
        }
        ;
    }

    $scope.confirm = function (id) {
        var index = $scope.findItem(id);
        if (index !== -1) {
            if ($(".table").find("tbody").find("tr").eq(index).find("td:last").find("button").attr("ng-disabled") == "true") {
                $.ajax({
                    url: '/order/updateBook?userId=' + loginId + '&id=' + id + '&book=' + $scope.cart[index].book + '&authority=' + loginAuthority,
                    type: 'GET',
                    success: function (result) {
                        var info = ""
                        if (loginAuthority == 3) {
                            info = "修改成功,等待管理员同意"
                        } else if (loginAuthority == 0) {
                            info = "修改成功"
                        }
                        if (result.data == "success") {
                            layer.open({
                                content: info,
                                scrollbar: false,
                                my: true
                            });
                        } else {
                            layer.open({
                                content: "修改失败！",
                                scrollbar: false,
                                my: true
                            });
                        }

                    }
                })
            }

        }
        ;
    }
    //减少一个商品数量
    $scope.reduce = function (id) {
        var index = $scope.findItem(id);
        if (index !== -1) {
            var item = $scope.cart[index]
            if (item.book > 1) {
                --item.book;
            } else {
                item.book = 1;
            }
        }
    };
    $scope.book = function (id) {
        var index = $scope.findItem(id);
        if (index !== -1) {
            if ($scope.cart[index].book >= $scope.cart[index].maxBook) {
                $scope.cart[index].book = $scope.cart[index].maxBook;
            }
        }
    }
    //增加一个商品数量
    $scope.add = function (id) {
        var index = $scope.findItem(id);
        if (index !== -1) {
            if ($scope.cart[index].book >= $scope.cart[index].maxBook) {
                $scope.cart[index].book = $scope.cart[index].maxBook;
            } else {
                ++$scope.cart[index].book;
            }

        }
        ;
    };
    $scope.$watch('cart', function (newvalue, oldvalue) {
        angular.forEach(newvalue, function (item, key) {
            if (item.quantity < 1 && item.quantity !== '') {
                var returnKey = confirm("是否从我的预订中删除该预订！");
                if (returnKey) {
                    $scope.remove(id);
                } else {
                    item.quantity = oldvalue[key].quantity;
                }
                ;
            }
            ;
        });
    }, true);

    $scope.stateInfo = function (id) {
        var index = $scope.findItem(id);
        if (index !== -1) {
            if (($scope.cart[index].stateInfo == "等待管理员同意") || ($scope.cart[index].stateInfo == "本人已取消预约") || ($scope.cart[index].stateInfo == "实验室管理员取消其预约")) {
                $(".table").find("tbody").find("tr").eq(index).find("td:last").find("button").removeClass("btn-danger")
                $(".table").find("tbody").find("tr").eq(index).find("td:last").find("button").attr("ng-disabled", "false");
                $(".table").find("tbody").find("tr").eq(index).find("td:last").find("button").removeAttr("ng-click");

            } else {
                $(".table").find("tbody").find("tr").eq(index).find("td:last").find("button").attr("ng-disabled", "true");
            }
        }
        ;
    }

}