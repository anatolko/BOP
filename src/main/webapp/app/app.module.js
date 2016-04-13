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

    Index.$inject = ['$translate', 'tmhDynamicLocale', '$translatePartialLoader'];
    runFunc.$inject = ['$rootScope', '$translate'];

    function Index($translate, tmhDynamicLocale, $translatePartialLoader) {
        var vm = this;

        $translatePartialLoader.addPart('global');

        vm.lang = $translate.use();

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
