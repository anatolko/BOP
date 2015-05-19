/**
 * Created by Stretch on 17.04.2015.
 */
(function(){



    var app = angular.module('bop',['pascalprecht.translate','ngCookies','ui.bootstrap']);

    app.config(['$translateProvider', function ($translateProvider) {
        $translateProvider.useStaticFilesLoader({
            prefix: 'js/lang/locale-',
            suffix: '.json'
        });
        $translateProvider.preferredLanguage('ru');
        $translateProvider.fallbackLanguage('en');
        $translateProvider.useCookieStorage();
    }]);

    app.controller('BopController',['$translate','$modal','$scope', function ($translate,$modal, $scope){
        this.user = testUser;
        this.bopCards = userBopCards;



        $scope.changeLanguage = function (langKey) {
            $translate.use(langKey);
        };

        $scope.newBopOpen = function (size) {

            var modalInstance = $modal.open({
                templateUrl: 'myModalContent.html',
                controller: 'ModalInstanceCtrl',
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

    app.controller('ModalInstanceCtrl', function ($scope, $modalInstance, items) {

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
    });

    app.controller('DatepickerCtrl', function ($scope) {
        $scope.maxDay = new Date();
        $scope.minDay = getMonday($scope.maxDay);
        $scope.mytime = new Date();

        $scope.today = function() {
            $scope.dt = new Date();
        };

        $scope.today();

        $scope.clear = function () {
            $scope.dt = null;
        };


        $scope.open = function($event) {
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
            diff = d.getDate() - day + (day == 0 ? -6:1); // adjust when day is sunday
        return new Date(d.setDate(diff));
    }

    var testUser = {
        name: 'Anatoly Yashkin',
        group: 'L',
        department: 'HR',
        site: 'RULIP'
    }

    var userBopCards=[
        {
            fillDate: '12.04.2015 15:00',
            obsDate: '12.04.2015 10:14',
            obsDepartment: 'Участок навивки канатов',
            obsRemarks: 'голова, лицо, руки',
            comment: 'Не носит средства индивидуальной защиты'

        },
        {
            fillDate: '11.02.2015 11:00',
            obsDate: '10.04.2015 18:14',
            obsDepartment: 'Склад готовой продукции',
            obsRemarks: 'управление транспортным средством',
            comment: 'Катается на погрузчике в неположеном месте'
        }
    ]
})();