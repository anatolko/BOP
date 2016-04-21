/*global angular, console*/
(function () {
    'use strict';

    angular
        .module('app.bop')
        .controller('CardForm', CardForm);

    CardForm.$inject =
        ['$translate', '$scope', 'obsDepartment','obsCategory','$uibModalInstance','Card', '$translatePartialLoader', 'param'];

    function CardForm($translate, $scope, obsDepartment, obsCategory, $uibModalInstance, Card, $translatePartialLoader, param) {
        var vm = this;

        $translatePartialLoader.addPart('card');

        vm.selectedDep = '';
        vm.checkedCats = [];
        vm.checkedFields = [];
        vm.comment = '';
        vm.obsInfo = [];
        vm.obsDepartments = [];
        vm.obsDate = new Date();
        vm.obsTime = new Date();
        vm.accountInfo = param.accountInfo;

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
            parentPlant: null,
            link: {href: 'http://localhost:8080/api/plants/1'}
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
            },
            link: {href: 'http://localhost:8080/api/user-groups/1'}
        };

        obsDepartment.getAllDepartments()
            .then(function (data) {
                vm.obsDepartments = data._embedded.obsDepartments;
            });

        obsCategory.getAllCategories()
            .then(function (data) {
                vm.obsInfo = data._embeddedItems;
            });

        function ok() {
            Card.addCard(
                new Date(
                        vm.obsDate.getFullYear(),
                        vm.obsDate.getMonth(),
                        vm.obsDate.getDate(),
                        vm.obsTime.getHours(),
                        vm.obsTime.getMinutes(),
                        vm.obsTime.getSeconds()
                    ),
                    vm.accountInfo._links.self.href,
                    vm.accountInfo.userGroup._links.self.href,
                    vm.selectedDep._links.self.href,
                    vm.plant.link.href,
                    JSON.stringify({categories: vm.checkedCats}),
                    JSON.stringify({fields: vm.checkedFields}),
                    vm.comment,
                    vm.userGroup.link.href
            ).then(function (card) {
                $uibModalInstance.close(card);
            });
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
