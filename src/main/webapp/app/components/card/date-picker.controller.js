(function () {
    'use strict';

    angular
        .module('app.bop')
        .controller('DatepickerCtrl',DatepickerCtrl);

    DatepickerCtrl.$inject = ['$scope'];

    function DatepickerCtrl($scope) {
        $scope.maxDay = new Date();
        $scope.minDay = getMonday($scope.maxDay);

        $scope.open = function ($event) {
            $event.preventDefault();
            $event.stopPropagation();

            $scope.opened = true;
        };

        $scope.dateOptions = {
            formatYear: 'yy',
            startingDay: 1
        };

        $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
        $scope.format = $scope.formats[0];

        function getMonday(d) {
            d = new Date(d);
            var day = d.getDay(),
                diff = d.getDate() - day + (day == 0 ? -6 : 1); // adjust when day is sunday
            return new Date(d.setDate(diff));
        }
    };
})();