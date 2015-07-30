/**
 * Created by Stretch on 17.04.2015.
 */
(function () {

    var app = angular.module('bop-app', ['pascalprecht.translate', 'ngCookies', 'ui.bootstrap', 'ngRoute']);

    app.config(['$translateProvider', '$routeProvider', function ($translateProvider, $routeProvider) {
        $translateProvider.useStaticFilesLoader({
            prefix: 'js/lang/locale-',
            suffix: '.json'
        });
        $translateProvider.preferredLanguage('ru');
        $translateProvider.fallbackLanguage('en');
        $translateProvider.useCookieStorage();


        $routeProvider
            .when('/home', {
                templateUrl: './views/user-page.html',
                controller: 'BopController'
            })
            .when('/reports', {
                templateUrl: './views/reports.html',
                controller: 'BopController'
            })
            .otherwise({
                redirectTo: '/home'
            });
    }]);


    app.controller('ObsController',['$http',function($http){
        var modal = this;
        modal.obsInfo = [];
        $http.get('./js/test_data/obs-info.json').success(function (data) {
            modal.obsInfo = data;
        });
    }]);
    app.controller('BopController', ['$translate', '$modal', '$scope', '$http', function ($translate, $modal, $scope, $http) {
        var bop = this;

        bop.user = [];
        bop.bopCards = [];

        $http.get('./js/test_data/test-user.json').success(function (data) {
            bop.user = data;
        });

        $http.get('./js/test_data/bop-cards.json').success(function (data) {
            bop.bopCards = data;
        });

        $scope.changeLanguage = function (langKey) {
            $translate.use(langKey);
        };

        $scope.newBopOpen = function (size) {

            var modalInstance = $modal.open({
                templateUrl: './views/modals/bop-card.html',
                controller: function ($scope, $modalInstance, items) {

                    $scope.items = items;
                    $scope.selected = {
                        item: $scope.items[0]
                    };
                    $scope.ok = function () {
                        $modalInstance.close($scope.selected.item);
                    };
                    $scope.cancel = function () {
                        $modalInstance.dismiss('cancel');
                    };
                },

                size: size,

                resolve: {
                    items: function () {
                        return true;
                    }
                }
            });

            modalInstance.result.then(function () {

            }, function () {

            });
        };

    }]);


    app.controller('DatepickerCtrl', function ($scope) {
        $scope.maxDay = new Date();
        $scope.minDay = getMonday($scope.maxDay);
        $scope.mytime = new Date();

        $scope.today = function () {
            $scope.dt = new Date();
        };

        $scope.today();

        $scope.clear = function () {
            $scope.dt = null;
        };


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

    });

    //function is getting start of week for date d
    function getMonday(d) {
        d = new Date(d);
        var day = d.getDay(),
            diff = d.getDate() - day + (day == 0 ? -6 : 1); // adjust when day is sunday
        return new Date(d.setDate(diff));
    }


})();