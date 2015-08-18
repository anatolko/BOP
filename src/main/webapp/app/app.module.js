(function () {
    'use strict';

    angular
        .module('app.bop', ['pascalprecht.translate', 'ngCookies', 'ui.bootstrap','ngResource','ui.router'])
        .controller('Index',Index);

    Index.$inject = ['$translate'];

    function Index($translate){
        var vm = this;

        vm.changeLanguage = function (langKey){
            $translate.use(langKey);
        }
    }
})();