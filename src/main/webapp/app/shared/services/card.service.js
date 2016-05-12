/*global angular*/

(function () {
    'use strict';
    var API_URL = 'api/cards';
    var API_URL_SEARCH = API_URL + '/search';

    angular
        .module('app.bop')
        .service('Card', Card);

    Card.$inject = ['$http', '$q', 'SpringDataRestAdapter'];

    function Card($http, $q, SpringDataRestAdapter) {

        // public API
        return ({
            addCard: addCard,
            deleteCard: deleteCard,
            getCard: getCard,
            getAllCards: getAllCards,
            getAllCardsByUserId: getAllCardsByUserId,
            getCountOfCardsForUserInPeriod: getCountOfCardsForUserInPeriod
        });

        function addCard(
            obsDate,
            profileId,
            userDepartment,
            obsDepartment,
            plant,
            selectedCategories,
            selectedFields,
            comment,
            userGroup
        ) {
            var request = $http({
                method: 'post',
                url: API_URL,
                data: {
                    cardDate: new Date(),
                    obsDate: obsDate,
                    user: profileId,
                    userDepartment: userDepartment,
                    obsDepartment: obsDepartment,
                    plant: plant,
                    selectedCategories: selectedCategories,
                    selectedFields: selectedFields,
                    comment: comment,
                    userGroup: userGroup
                }
            });

            return (request.then(handleSuccess, handleError));
        }

        function deleteCard(id) {
            var request = $http({
                method: 'delete',
                url: API_URL + '/' + id
            });

            return (request.then(handleSuccess, handleError));
        }

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

            return (request.then(handleHateoasSuccess, handleError));
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

            return (request.then(handleHateoasSuccess, handleError));
        }

        /**
         * returns all BOP cards for user
         *
         * @param id user id
         * @param size - size of page
         * @param page - number of page
         * @param sort - type of sorting
         *
         * @returns promise with request
         */
        function getAllCardsByUserId(id, size, page, sort) {
            var request = $http({
                method: 'get',
                url: API_URL_SEARCH + '/findAllByUserId',
                params: {
                    userId: id,
                    size: size,
                    page: page,
                    sort: sort
                }
            });
            return (request.then(handleHateoasSuccess, handleError));
        }

        function getCountOfCardsForUserInPeriod(userId, startDate, endDate) {
            var request = $http({
                method: 'get',
                url: API_URL_SEARCH + '/countByUserIdAndCardDateBetween',
                params: {
                    userId: userId,
                    startDate: startDate,
                    endDate: endDate
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
            return response.data;
        }

        function handleHateoasSuccess(response) {
            // getting data from HATEOAS links
            return SpringDataRestAdapter.process(response, 'obsDepartment');
        }
    }
})();
