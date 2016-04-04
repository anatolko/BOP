(function () {
    'use strict';

    angular
        .module('app.bop')
        .factory('obsField', obsField);

    obsField.$inject = ['$resource'];

    function obsField($resource) {
        return $resource('api/obs-fields/:id', {id:'@id'});
    }
})();
