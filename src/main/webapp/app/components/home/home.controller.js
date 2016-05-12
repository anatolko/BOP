(function () {
    'use strict';

    angular
        .module('app.bop')
        .controller('HomeInfo', HomeInfo);

    HomeInfo.$inject =
        ['$timeout','$scope', '$uibModal', 'Card','obsCategory','obsField','$translatePartialLoader', 'DateUtil'];

    function HomeInfo($timeout, $scope, $uibModal, Card, obsCategory, obsField, $translatePartialLoader, DateUtil) {
        var vm = this;
        vm.cadsForWeek = 0;
        vm.page = {};
        vm.cardsPerPage = 5;
        vm.maxPagerSize = 10;

        // variable for table sorting
        vm.sort = {
            sortingOrder: 'id',
            order: 'desc',
            reverse: false
        };

        $translatePartialLoader.addPart('home');

        // getting cards for table
        function getAllCardsForCurrentUser() {
            if ($scope.authenticatedAccount !== null) {
                Card.getAllCardsByUserId($scope.authenticatedAccount.id,
                    vm.cardsPerPage, $scope.currentPage - 1, (vm.sort.sortingOrder + ',' + vm.sort.order))
                    .then(function (data) {
                        vm.cards = data._embeddedItems;
                        vm.page = data.page;
                    });
            }
        }

        function getUserCardsForWeek() {
            if ($scope.authenticatedAccount !== null) {
                var mondayDate = DateUtil.getStartOfDate(DateUtil.getMondayDate(new Date())).toString();
                var sundayDate = DateUtil.getEndOfDate(DateUtil.getSundayDate(new Date())).toString();
                Card.getCountOfCardsForUserInPeriod($scope.authenticatedAccount.id,
                    mondayDate,
                    sundayDate)
                    .then(function (data) {
                        vm.cadsForWeek = data;
                    });
            }
        }

        $scope.$watchGroup(['currentPage', 'authenticatedAccount'], function (newVal, oldVal) {
            getAllCardsForCurrentUser();
            getUserCardsForWeek();
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

        /**
         * delete BOP Card by id
         * @param id of BOP Card
         */
        vm.deleteCard = function (id) {
            if (typeof id !== 'undefined') {
                Card.deleteCard(id).then(function () {
                    $timeout(function () {
                        getAllCardsForCurrentUser();
                        getUserCardsForWeek();
                    });
                });
            }
        }

        vm.canChangeCard = function (cardDate) {
            var mondayDate = DateUtil.getStartOfDate(DateUtil.getMondayDate(new Date()));
            return (new Date(cardDate)).getTime() >= mondayDate.getTime() ||
                $scope.authenticatedAccount.userRole.name === 'ROLE_ADMIN';
        }

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
                backdrop: 'static',
                resolve: {
                    param: {
                        accountInfo: $scope.authenticatedAccount
                    }
                }
            });

            // update table with cards after modal closing
            modalInstance.result.then(function () {
                $timeout(function () {
                    getAllCardsForCurrentUser();
                    getUserCardsForWeek();
                });
            });
        };
    }
})();
