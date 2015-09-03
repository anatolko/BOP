(function(){
    'use strict';

    angular
        .module('app.bop')
        .factory('obsCategory', obsCategory);

    obsCategory.$inject = ['$resource'];

    function obsCategory($resource){
        return $resource('api/obs-categories/:id',{id:'@id'});
    }
})();