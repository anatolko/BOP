(function () {
    'use strict';

    angular
        .module('app.bop')
        .controller('CardForm',CardForm);

    CardForm.$inject = ['$translate','$http','obsDepartment'];

    function CardForm($translate,$http,obsDepartment){
        var vm = this;
        vm.obsInfo = [];
        vm.obsDepartments = obsDepartment.query();
        vm.lang = $translate.use();
        $http.get('./assets/data/test/obs-info.json').success(function (data) {
            vm.obsInfo = data;
        });

    }
})();
