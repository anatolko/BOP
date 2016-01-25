//In this file we will confing routes for out application
(function () {
    'use strict';

        angular
            .module('app.bop')
            .config(routes);

        function routes($stateProvider, $urlRouterProvider){
            $urlRouterProvider.otherwise('/home');

            $stateProvider
                .state('home', {
                    url: '/home',
                    templateUrl: 'app/components/home/home.view.html',
                    controller: 'HomeInfo'
                })

                .state('reports', {
                    url: '/reports',
                    templateUrl: 'app/components/reports/reports.view.html',
                    controller: 'HomeInfo'
                })

                .state('login', {
                    url: '/login',
                    templateUrl: 'app/components/login/login.view.html',
                    controller: 'Login'
                })
        }
}
)();