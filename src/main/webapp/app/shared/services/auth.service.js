/*global angular*/
(function () {
    'use strict';

    var API_URL = 'api/account';
    var LOGIN_URL = 'api/authentication';
    var LOGOUT_URL = 'api/logout';

    angular
        .module('app.bop')
        .service('Auth', Auth);

    Auth.$inject = ['$http', '$q', 'SpringDataRestAdapter'];

    function Auth($http, $q, SpringDataRestAdapter) {
        return ({
            login: login,
            logout: logout,
            getCurrentUserInfo: getCurrentUserInfo,
            isAuthenticated: isAuthenticated
        });

        function login(credentials) {
            var request = $http({
                method: 'post',
                url: LOGIN_URL,
                data: 'bop_email=' + encodeURIComponent(credentials.email) +
                        '&bop_password=' + encodeURIComponent(credentials.password) +
                        '&remember-me=' + credentials.rememberMe,
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            });

            return (request.then(handleSuccess, handleError));
        }

        function logout() {
            var request = $http({
                method: 'post',
                url: LOGOUT_URL
            });

            return (request.then(handleSuccess, handleError));
        }

        function getCurrentUserInfo() {
            var request = $http({
                method: 'get',
                url: API_URL + '/info'
            });

            return (request.then(handleHateoasSuccess, handleError));
        }

        function isAuthenticated() {
            var request = $http({
                method: 'get',
                url: API_URL + '/authenticate'
            });

            return (request.then(handleSuccess, handleError));
        }

        // I transform the error response, unwrapping the application dta from
        // the API response payload.
        function handleError(response) {
            // The API response from the server should be returned in a
            // nomralized format. However, if the request was not handled by the
            // server (or what not handles properly - ex. server error), then we
            // may have to normalize it on our end, as best we can.
            if (!angular.isObject(response.data) || !response.data.message) {
                return ($q.reject('An unknown error occurred.'));
            }
            // Otherwise, use expected error message.
            return ($q.reject(response.data.message));
        }
        // I transform the successful response, unwrapping the application data
        // from the API response payload.
        function handleSuccess(response) {
            return response.data;
        }

        function handleHateoasSuccess(response) {
            return SpringDataRestAdapter.process(response, '_allLinks');
        }
    }
})();
