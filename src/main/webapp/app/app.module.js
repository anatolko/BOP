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

        vm.changeLanguage = function (langKey) {
            $translate.use(langKey);
            vm.lang = $translate.use();
            tmhDynamicLocale.set(langKey);
        };

        // ===================== Global authentication info ===============================
        $scope.authenticatedAccount = null;
        $scope.isAuthenticated = null;

        $scope.$on('authenticationSuccess', function () {
            getAccount();
        });

        $scope.$on('logoutSuccess', function () {
            $scope.authenticatedAccount = null;
            $scope.isAuthenticated = false;
        });

        // when page loading checking user authentication
        Auth.isAuthenticated().then(function (authName) {
            if (authName.length > 0) {
                // if user authenticated then we getting user info
                getAccount();
            } else {
                $scope.isAuthenticated = false;
            }
        });

        function getAccount() {
            Auth.getCurrentUserInfo().then(function (account) {
                $scope.isAuthenticated = (account !== null);
                $scope.authenticatedAccount = account;
            }).catch(function () {
                $scope.authenticatedAccount = null;
                $scope.isAuthenticated = false;
            });
        }
        // ==================================================================================
    }

    function runFunc($rootScope, $translate) {
        // refreshing $traslate after loading of new translation file
        $rootScope.$on('$translatePartialLoaderStructureChanged', function () {
            $translate.refresh();
        });
    }

})();
