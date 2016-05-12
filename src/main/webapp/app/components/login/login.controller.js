/*global angular*/
(function () {
    'use strict';

    angular
        .module('app.bop')
        .controller('Login', Login);

    Login.$inject = ['$translatePartialLoader', 'Auth', '$rootScope','$location'];

    function Login($translatePartialLoader, Auth, $rootScope, $location) {
        $translatePartialLoader.addPart('login');

        var vm = this;

        vm.authenticationError = false;
        vm.email = null;
        vm.password = null;
        vm.rememberMe = true;

        vm.login = login;
        vm.logout = logout;

        function login() {
            Auth.login({
                email: vm.email,
                password: vm.password,
                rememberMe: vm.rememberMe
            }).then(function () {
                vm.authenticationError = false;
                $location.url('/');
                $rootScope.$broadcast('authenticationSuccess');
            }).catch(function () {
                vm.authenticationError = true;
            });
        }

        function logout() {
            Auth.logout().then(function () {
                window.location = '/login';
                $rootScope.$broadcast('logoutSuccess');
            });
        }
    }
})();
