var cartController = function ($scope) {

    $scope.cart = [
        {
            id: 100,
            name: 'iphone5s',
            quantity: 2,
            price: 4300
        },
        {
            id: 130,
            name: 'iphone5',
            quantity: 1,
            price: 2100
        },
        {
            id: 200,
            name: 'imac',
            quantity: 5,
            price: 14300
        },
        {
            id: 110,
            name: 'ipid',
            quantity: 30,
            price: 3300
        }
    ];
    //总购买数量
    $scope.totalQuantity = function () {
        var total = 0;
        angular.forEach($scope.cart, function (item) {
            total += parseInt(item.quantity);
        });
        return total;
    };
    //总购买价格
    $scope.totalPrice = function () {
        var total = 0;
        angular.forEach($scope.cart, function (item) {
            total += parseInt(item.quantity * item.price);
        });
        return total;
    };
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
    //移除table
    $scope.remove = function (id) {
        var index = $scope.findItem(id);
        if (index !== -1) {
            $scope.cart.splice(index, 1);
        }
        ;
    };
    //减少一个商品数量
    $scope.reduce = function (id) {
        var index = $scope.findItem(id);
        if (index !== -1) {
            var item = $scope.cart[index]
            if (item.quantity > 1) {
                --item.quantity;
            } else {
                var returnKey = confirm("是否从购物车中删除该产品！");
                if (returnKey) {
                    $scope.remove(id);
                }
            }
        }
    };
    //增加一个商品数量
    $scope.add = function (id) {
        var index = $scope.findItem(id);
        if (index !== -1) {
            ++$scope.cart[index].quantity;
        }
        ;
    };
    $scope.$watch('cart', function (newvalue, oldvalue) {
        angular.forEach(newvalue, function (item, key) {
            if (item.quantity < 1 && item.quantity !== '') {
                var returnKey = confirm("是否从购物车中删除该产品！");
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
}