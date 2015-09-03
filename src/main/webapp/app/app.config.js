//In this file we will config libs
(function () {
    'use strict';

    angular
        .module('app.bop')
        .config(configure);

    configure.$inject =
        ['$translateProvider', 'tmhDynamicLocaleProvider'];

    function configure($translateProvider, tmhDynamicLocaleProvider) {
        $translateProvider.useStaticFilesLoader({
            prefix: './assets/data/lang/locale-',
            suffix: '.json'
        });
        $translateProvider.preferredLanguage('ru');
        $translateProvider.fallbackLanguage('en');
        $translateProvider.useCookieStorage();
        $translateProvider.useSanitizeValueStrategy('escape');

        tmhDynamicLocaleProvider.useCookieStorage();
        tmhDynamicLocaleProvider.localeLocationPattern('assets/libs/angular-i18n/angular-locale_{{locale}}.js')


    }
})();