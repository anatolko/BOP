/*global angular, console*/
(function () {
    'use strict';

    angular
        .module('app.bop')
        .controller('CardForm', CardForm);

    CardForm.$inject =
        ['$translate','obsDepartment','obsCategory','$uibModalInstance','Card', '$translatePartialLoader'];

    function CardForm($translate, obsDepartment, obsCategory, $uibModalInstance, Card, $translatePartialLoader) {
        var vm = this;

        $translatePartialLoader.addPart('card');

        vm.selectedDep = '';
        vm.checkedCats = [];
        vm.checkedFields = [];
        vm.comment = '';
        vm.obsInfo = obsCategory.query();
        vm.obsDepartments = [];
        vm.obsDate = new Date();
        vm.obsTime = new Date();

        // getting current language
        vm.lang = $translate.use();

        // settings for calendar
        vm.maxDay = new Date();
        vm.minDay = getMonday(vm.maxDay);

        // form button functions
        vm.ok = ok;
        vm.cancel = cancel;

        // temp data about user plant
        vm.plant = {
            id: 1,
            plantCode: 'RULIP',
            description: 'Lipetsk plant',
            parentPlant: null
        };

        // temp data about user group
        vm.userGroup = {
            id: 1,
            name: 'L',
            cardsCount: 1,
            plant: {
                id: 1,
                plantCode: 'RULIP',
                description: 'Lipetsk plant',
                parentPlant: null
            }
        };

        obsDepartment.getAllDepartments()
            .then(function (data) {
                vm.obsDepartments = data._embedded.obsDepartments;
            });

        function ok() {
            Card.save(
                {
                    cardDate: new Date(),
                    obsDate: new Date(
                        vm.obsDate.getFullYear(),
                        vm.obsDate.getMonth(),
                        vm.obsDate.getDate(),
                        vm.obsTime.getHours(),
                        vm.obsTime.getMinutes(),
                        vm.obsTime.getSeconds()
                    ),
                    adAccount: 'ayashkin',
                    userDepartment: 'HR',
                    obsDepartment: vm.selectedDep.toJSON(),
                    plant: vm.plant,
                    selectedFields: JSON.stringify({fields: vm.checkedFields}),
                    comment: vm.comment,
                    userGroup: vm.userGroup,
                    selectedCategories: JSON.stringify({categories: vm.checkedCats})
                }, function (card) {
                    $uibModalInstance.close(card);
                }, function (e) {
                    console.log(e);
                }
            );
        }

        function cancel() {
            $uibModalInstance.dismiss('cancel');
        }

        function getMonday(d) {
            d = new Date(d);
            var day = d.getDay();
            var diff = d.getDate() - day + (day === 0 ? -6 : 1); // adjust when day is sunday

            return new Date(d.setDate(diff));
        }
    }
})();
