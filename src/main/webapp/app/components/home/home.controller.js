(function () {
    'use strict';

    angular
        .module('app.bop')
        .controller('HomeInfo', HomeInfo);

    HomeInfo.$inject = ['$modal', '$http'];

    function HomeInfo($modal, $http) {
        var vm = this;
        vm.user = [];
        vm.cards = [];


        $http.get('./assets/data/test/test-user.json').success(function (data) {
            vm.user = data;
        });

        $http.get('./assets/data/test/bop-cards.json').success(function (data) {
            vm.cards = data;
        });


        /*ui.bootstrap.modal*/
        vm.newCard = function (size) {
            var modalInstance = $modal.open({
                templateUrl: 'app/components/card/card.view.html',
                controller: function ($scope, $modalInstance) {

                    $scope.ok = function () {
                        $modalInstance.close('ok');
                    };
                    $scope.cancel = function () {
                        $modalInstance.dismiss('cancel');
                    };

                },
                size: size,
                backdrop: 'static'
            });
        }
    }
})();
