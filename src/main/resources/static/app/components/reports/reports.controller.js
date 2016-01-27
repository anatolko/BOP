(function () {
    'use strict';

    angular
        .module('app.bop')
        .controller('Reports', Reports);

    Reports.$inject = ['$translatePartialLoader'];

    function Reports($translatePartialLoader) {
        $translatePartialLoader.addPart('reports');
    }
})();

