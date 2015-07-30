require.config({
    paths: {
        'angular': '../bower_components/angular/angular.min',
        'angular-route': '../bower_components/angular-route/angular-route.min',
        'angularAMD': '../bower_components/angularAMD/angularAMD.min',
        'angular-translate': '../bower_components/angular-translate/angular-translate.min',
        'angular-locale_ru-ru': '../bower_components/angular-i18n/angular-locale_ru-ru',
        'angular-locale_en': '../bower_components/angular-i18n/angular-locale_en',
        'angular-cookies': '../bower_components/angular-cookies/angular-cookies.min',
        'angular-translate-storage-cookie': '../bower_components/angular-translate-storage-cookie/angular-translate-storage-cookie.min',
        'angular-translate-loader-static-files': '../bower_components/angular-translate-loader-static-files/angular-translate-loader-static-files.min',
        'ui-bootstrap': '../bower_components/angular-bootstrap/ui-bootstrap-tpls.min'
    },
    shim: {
        'angularAMD': ['angular'],
        'angular-route': ['angular'],
        'angular-translate':['angular'],
        'angular-locale_ru-ru':['angular','angular-translate'],
        'angular-locale_en':['angular','angular-translate'],
        'angular-cookies':['angular'],
        'angular-translate-storage-cookie':['angular','angular-cookies','angular-translate'],
        'angular-translate-loader-static-files':['angular','angular-translate'],
        'ui-bootstrap':['angular']
    },
    deps: ['app']
});