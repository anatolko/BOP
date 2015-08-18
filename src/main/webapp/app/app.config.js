(function () {
    'use strict';

    angular
        .module('app.bop')
        .config(configure);

    configure.$inject =
        ['$translateProvider'];

    function configure($translateProvider) {
        $translateProvider.useStaticFilesLoader({
            prefix: './assets/data/lang/locale-',
            suffix: '.json'
        });
        $translateProvider.preferredLanguage('ru');
        $translateProvider.fallbackLanguage('en');
        $translateProvider.useCookieStorage();
        $translateProvider.useSanitizeValueStrategy('escape');


    }
})();