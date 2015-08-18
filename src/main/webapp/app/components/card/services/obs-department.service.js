(function(){
    'use strict';

    angular
        .module('app.bop')
        .factory('obsDepartment', obsDepartment);

    obsDepartment.$inject = ['$resource'];

    function obsDepartment($resource){
        return $resource('obs-departments/:id', {}, {
            query: {method:'GET', params:{id:'@id'}}
        });
    }
})();