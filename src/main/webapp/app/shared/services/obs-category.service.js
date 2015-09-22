(function(){
    'use strict';

    angular
        .module('app.bop')
        .factory('obsCategory', obsCategory);

    obsCategory.$inject = ['$resource'];

    function obsCategory($resource){
        return $resource('obs-categories/:id',{},
            {
                'update': {method: 'PUT', params: {id: '@id'}}
            }
        );
    }
})();