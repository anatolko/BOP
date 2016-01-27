(function () {
    'use strict';

    angular
        .module('app.bop',
            ['pascalprecht.translate',
                'ngCookies',
                'ui.bootstrap',
                'ngResource',
                'ui.router',
                'spring-data-rest',
                'tmh.dynamicLocale',
                'checklist-model'])
        .controller('Index', Index);

    Index.$inject = ['$translate', 'tmhDynamicLocale'];

    function Index($translate, tmhDynamicLocale) {
        var vm = this;

        vm.lang = $translate.use();

        vm.changeLanguage = function (langKey) {
            $translate.use(langKey);
            vm.lang = $translate.use();
            tmhDynamicLocale.set(langKey);
        };
    }
})();
