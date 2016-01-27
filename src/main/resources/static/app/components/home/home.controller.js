(function () {
    'use strict';

    angular
        .module('app.bop')
        .controller('HomeInfo', HomeInfo);

    HomeInfo.$inject =
        ['$timeout','$scope', '$uibModal', '$http', 'Card','obsCategory','obsField','$translatePartialLoader'];

    function HomeInfo($timeout,$scope, $uibModal, $http, Card, obsCategory, obsField, $translatePartialLoader) {
        var vm = this;
        vm.user = [];
        vm.page = {};

        $translatePartialLoader.addPart('home');

        // vm.cards = Card.get();

        // variable for table sorting
        vm.sort = {
            sortingOrder: 'id',
            order: 'desc',
            reverse: false
        };

        // getting cards for table
        $scope.$watch('currentPage', function () {
            Card.get({
                    size: 5,
                    page: $scope.currentPage - 1,
                    sort: (vm.sort.sortingOrder + ',' + vm.sort.order)
                },
                function (data) {
                    $scope.cards = data.content;
                    vm.page.last = data.last;
                    vm.page.totalPages = data.totalPages;
                    vm.page.totalElements = data.totalElements;
                    vm.page.size = data.size;
                    vm.page.number = data.number;
                });
        });

        vm.getObsCats = function (idArr) {
            var resultArr = [];
            idArr.forEach(function (id) {
                var cat = obsCategory.get({id: id});
                resultArr.push(cat);
            });
            return resultArr;
        };

        vm.getObsFields = function (idArr) {
            var resultArr = [];
            idArr.forEach(function (id) {
                var field = obsField.get({id: id});
                resultArr.push(field);
            });
            return resultArr;
        };

        $http.get('./assets/data/test/test-user.json').success(function (data) {
            vm.user = data;
        });

        // $http.get('./assets/data/test/bop-cards.json').success(function (data) {
        //     vm.cards = data;
        // });

        /*ui.bootstrap.modal*/
        vm.newCard = function (size) {
            var modalInstance = $uibModal.open({
                templateUrl: 'app/components/card/card.view.html',
                controller: 'CardForm as card',
                size: size,
                backdrop: 'static'
            });

            modalInstance.result.then(function () {
                $timeout(function () {
                    Card.get({
                            size: 5,
                            page: $scope.currentPage - 1,
                            sort: (vm.sort.sortingOrder + ',' + vm.sort.order)
                        },
                        function (data) {
                            $scope.cards = data.content;
                            vm.page.last = data.last;
                            vm.page.totalPages = data.totalPages;
                            vm.page.totalElements = data.totalElements;
                            vm.page.size = data.size;
                            vm.page.number = data.number;
                        });
                });
            });
        };
    }
})();
