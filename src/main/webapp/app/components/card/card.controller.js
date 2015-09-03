(function () {
    'use strict';

    angular
        .module('app.bop')
        .controller('CardForm',CardForm);

    CardForm.$inject = ['$translate','$http','obsDepartment','obsCategory','SpringDataRestAdapter','$modalInstance','Card'];

    function CardForm($translate,$http,obsDepartment,obsCategory,SpringDataRestAdapter,$modalInstance, Card){
        var vm = this;

        vm.checkedCats = [];
        vm.checkedFields = [];
        vm.obsDate = new Date();
        vm.obsTime = new Date();


        var httpPromise = $http.get('api/obs-categories');

        SpringDataRestAdapter.process(httpPromise, 'obsFields', true).then(function (processedResponse) {
            vm.obsInfo = processedResponse._embeddedItems;
            vm.processedResponse = angular.toJson(processedResponse, true);
        });

        vm.obsDepartments = obsDepartment.get();
        vm.lang = $translate.use();



        vm.ok = function () {
            new Card(
                {
                    cardDate: new Date(),
                    obsDate: new Date(vm.obsDate.getFullYear(), vm.obsDate.getMonth(), vm.obsDate.getDate(), vm.obsTime.getHours(), vm.obsTime.getMinutes(), vm.obsTime.getSeconds()),
                    adAccount: 'ayashkin',
                    userDepartment: 'HR',
                    obsDepartment: "/"+vm.selectedDep,
                    plant: "/4",
                    selectedFields: JSON.stringify({fields: vm.checkedFields}),
                    comment: vm.comment,
                    userGroup: "/1",
                    selectedCategories: JSON.stringify({categories: vm.checkedCats})
                }).save();

            $modalInstance.close('ok');
        };
        vm.cancel = function () {
            $modalInstance.dismiss('cancel');
        };

    }
})();
