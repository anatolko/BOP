(function () {
    'use strict';

    angular
        .module('app.bop',
            ['pascalprecht.translate',
                'ngCookies',
                'ngAnimate',
                'ui.bootstrap',
                'ngResource',
                'ui.router',
                'spring-data-rest',
                'tmh.dynamicLocale',
                'checklist-model'])
        .controller('Index', Index)
        .run(runFunc);

    Index.$inject = ['$translate', 'tmhDynamicLocale', '$translatePartialLoader', '$scope', 'Auth'];
    runFunc.$inject = ['$rootScope', '$translate'];

    function Index($translate, tmhDynamicLocale, $translatePartialLoader, $scope, Auth) {
        var vm = this;

        $translatePartialLoader.addPart('global');

        vm.lang = $translate.use();

        vm.account = null;
        vm.isAuthenticated = null;

        $scope.$on('authenticationSuccess', function () {
            getAccount();
        });

        $scope.$on('logoutSuccess', function () {
            getAccount();
        });

        getAccount();

        function getAccount() {
            Auth.getUserInfo().then(function (account) {
                vm.account = account;
                vm.isAuthenticated = true;
            }).catch(function () {
                vm.isAuthenticated = false;
            });
        }

        vm.changeLanguage = function (langKey) {
            $translate.use(langKey);
            vm.lang = $translate.use();
            tmhDynamicLocale.set(langKey);
        };
    }

    function runFunc($rootScope, $translate) {
        // refreshing $traslate after loading of new translation file
        $rootScope.$on('$translatePartialLoaderStructureChanged', function () {
            $translate.refresh();
        });
    }

})();
