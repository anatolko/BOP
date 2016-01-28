/*global angular*/
(function () {
    'use strict';
    angular
        .module('app.bop')
        .factory('Card', Card);

    Card.$inject = ['$resource'];

    function Card($resource) {
        return $resource('api/cards/:id', {},
            {
                update: {method: 'PUT', params: {id: '@id'}}
            }
        );
    }
})();
