(function () {
    'use strict';
    var HATEOAS_URL = './api/cards';
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
