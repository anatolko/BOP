/*global angular*/
(function () {
    'use strict';

    angular
        .module('app.bop')
        .controller('Login', Login);

    Login.$inject = ['$translatePartialLoader'];

    function Login($translatePartialLoader) {
        var vm = this;
        $translatePartialLoader.addPart('login');
    }
})();
