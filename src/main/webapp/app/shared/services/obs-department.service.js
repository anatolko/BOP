(function(){
    'use strict';

    angular
        .module('app.bop')
        .factory('obsDepartment', obsDepartment);

    obsDepartment.$inject = ['$resource'];

    function obsDepartment($resource){
        return $resource('api/obs-departments/:id', {id:'@id'});
    }
})();