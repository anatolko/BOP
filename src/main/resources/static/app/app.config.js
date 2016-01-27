// In this file we will config libs
(function () {
    'use strict';

    angular
        .module('app.bop')
        .config(configure);

    configure.$inject =
        ['$translateProvider', 'tmhDynamicLocaleProvider', '$httpProvider'];

    function configure($translateProvider, tmhDynamicLocaleProvider, $httpProvider) {
        $translateProvider.useLoader('$translatePartialLoader', {
            urlTemplate: 'i18n/{lang}/{part}.json'
        });

        $translateProvider.preferredLanguage('ru');
        $translateProvider.fallbackLanguage('en');
        $translateProvider.useCookieStorage();
        $translateProvider.useSanitizeValueStrategy('escape');

        tmhDynamicLocaleProvider.useCookieStorage();
        tmhDynamicLocaleProvider.localeLocationPattern('assets/libs/angular-i18n/angular-locale_{{locale}}.js');
        tmhDynamicLocaleProvider.storageKey('NG_TRANSLATE_LANG_KEY');

        $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
    }
})();
