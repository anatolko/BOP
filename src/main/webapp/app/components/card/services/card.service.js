(function(){
    'use strict';

    angular
        .module('app.bop')
        .factory('Card', obsDepartment);

    obsDepartment.$inject = ['$resource'];

    function obsDepartment($resource){
        return $resource('obs-departments/:id', {}, {
            query: {method:'GET', params:{id:'@id'}}
        });
    }
})();