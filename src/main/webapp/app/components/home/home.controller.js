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
        vm.cardsPerPage = 5;

        // variable for table sorting
        vm.sort = {
            sortingOrder: 'id',
            order: 'desc',
            reverse: false
        };

        $translatePartialLoader.addPart('home');

        // getting cards for table
        function getAllCards() {
            Card.getAllCards(vm.cardsPerPage, $scope.currentPage - 1, (vm.sort.sortingOrder + ',' + vm.sort.order))
                .then(function (data) {
                    vm.cards = data._embeddedItems;
                    vm.page = data.page;
                });
        }

        $scope.$watch('currentPage', function () {
            getAllCards();
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
                            resultArr.push(data);
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
         * @param size of modal window
         */
        vm.newCard = function (size) {
            var modalInstance = $uibModal.open({
                templateUrl: 'app/components/card/card.view.html',
                controller: 'CardForm as card',
                size: size,
                backdrop: 'static'
            });

            // update table with cards after modal closing
            modalInstance.result.then(function () {
                $timeout(function () {
                    getAllCards();
                });
            });
        };
    }
})();
