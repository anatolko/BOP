/*global angular*/
(function () {
    'use strict';
    var API_URL = 'api/cards';

    angular
        .module('app.bop')
        .service('Card', Card);

    Card.$inject = ['$http', '$q', 'SpringDataRestAdapter'];

    function Card($http, $q, SpringDataRestAdapter) {

        // public API
        return ({
            getCard: getCard,
            getAllCards: getAllCards
        });

        /**
         * get one card by id
         * @param id of card
         * @returns promise with request
         */
        function getCard(id) {
            var request = $http({
                method: 'get',
                url: API_URL + '/' + id
            });

            return (request.then(handleSuccess, handleError));
        }

        /**
         * get cards from server by parameters
         * @param size of page with cards
         * @param page number of page
         * @param sort page sorting
         * @returns promise with request
         */
        function getAllCards(size, page, sort) {
            var request = $http({
                method: 'get',
                url:  API_URL,
                params: {
                    size: size,
                    page: page,
                    sort: sort
                }
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
            // getting data from HATEOAS links
            return SpringDataRestAdapter.process(response, 'obsDepartment');
        }
    }
})();
