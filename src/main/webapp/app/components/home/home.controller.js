(function () {
    'use strict';

    angular
        .module('app.bop')
        .controller('HomeInfo', HomeInfo);

    HomeInfo.$inject =
        ['$timeout','$scope', '$uibModal', '$http', 'Card','obsCategory','obsField','$translatePartialLoader'];

    function HomeInfo($timeout, $scope, $uibModal, $http, Card, obsCategory, obsField, $translatePartialLoader) {
        var vm = this;
        vm.user = [];
        vm.page = {};

        $translatePartialLoader.addPart('home');

        // variable for table sorting
        vm.sort = {
            sortingOrder: 'id',
            order: 'desc',
            reverse: false
        };

        // getting cards for table
        $scope.$watch('currentPage', function () {
            Card.getAllCards(5, $scope.currentPage - 1, (vm.sort.sortingOrder + ',' + vm.sort.order))
                .then(function (data) {
                    vm.cards = data._embeddedItems;
                    vm.page = data.page;
                });
        });

        /**
         * get categories by their id's
         * @param idArr array of category id's
         * @returns {Array} information about all categories
         */
        vm.getObsCats = function (idArr) {
            var resultArr = [];
            if (typeof idArr !== 'undefined') {
                idArr.forEach(function (id) {
                    obsCategory.getCategory(id)
                        .then(function (data) {
                            var cat = data;
                            resultArr.push(cat);
                        });
                });
            }
            return resultArr;
        };

        /**
         * get fields by their id's
         * @param idArr array of fields id's
         * @returns {Array} information about all fileds
         */
        vm.getObsFields = function (idArr) {
            var resultArr = [];
            if (typeof idArr !== 'undefined') {
                idArr.forEach(function (id) {
                    var field = obsField.get({id: id});
                    resultArr.push(field);
                });
            }
            return resultArr;
        };

        $http.get('./assets/data/test/test-user.json').success(function (data) {
            vm.user = data;
        });

        /*ui.bootstrap.modal*/
        /**
         * function opening modal window to create new BOP card
         * @param size size of modal window
         */
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
