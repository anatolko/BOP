(function () {
    'use strict';

    angular
        .module('app.bop')
        .controller('CardForm',CardForm);

    CardForm.$inject = ['$translate','obsDepartment','obsCategory','$modalInstance','Card'];

    function CardForm($translate,obsDepartment,obsCategory,$modalInstance, Card){
        var vm = this;

        vm.checkedCats = [];
        vm.checkedFields = [];
        vm.comment = "";
        vm.obsDate = new Date();
        vm.obsTime = new Date();

        vm.plant = '{"id":1,"plantCode":"RULIP","description":"Lipetsk plant","parentPlant":null}';
        vm.userGroup = '{"id":1,"name":"L","cardsCount":1,"plant":{"id":1,"plantCode":"RULIP","description":"Lipetsk plant","parentPlant":null}}';

        vm.obsInfo = obsCategory.query();
        vm.obsDepartments = obsDepartment.query();
        vm.lang = $translate.use();





        vm.ok = function () {
            Card.save(
                {
                    cardDate: new Date(),
                    obsDate: new Date(vm.obsDate.getFullYear(), vm.obsDate.getMonth(), vm.obsDate.getDate(), vm.obsTime.getHours(), vm.obsTime.getMinutes(), vm.obsTime.getSeconds()),
                    adAccount: 'ayashkin',
                    userDepartment: 'HR',
                    obsDepartment: vm.selectedDep.toJSON(),
                    plant: JSON.parse(vm.plant),
                    selectedFields: JSON.stringify({fields: vm.checkedFields}),
                    comment: vm.comment,
                    userGroup: JSON.parse(vm.userGroup),
                    selectedCategories: JSON.stringify({categories: vm.checkedCats})
                },function(card){
                    $modalInstance.close(card);
                },function(e){
                    console.log(e);
                });
        };
        vm.cancel = function () {
            $modalInstance.dismiss('cancel');
        };

    }
})();
