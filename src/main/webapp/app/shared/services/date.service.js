/*global angular*/
(function () {
    'use strict';

    angular
        .module('app.bop')
        .service('DateUtil', DateUtil);

    DateUtil.$inject = [];

    function DateUtil() {

        return ({
            getMondayDate: getMondayDate,
            getSundayDate: getSundayDate,
            getDateWithoutTime: getDateWithoutTime,
            getEndOfDate:getEndOfDate,
            getStartOfDate: getStartOfDate
        });

        /**
         * returns Monday date, WARNING!!! Time will be not changed
         *
         * @param date - date of week
         * @returns {Date}
         */
        function getMondayDate(date) {
            date = new Date(date);
            return new Date(date.setDate(date.getDate() - date.getDay() + 1));
        }

        /**
         * returns Sunday date, WARNING!!! Time will be not changed
         *
         * @param date
         * @returns {Date}
         */
        function getSundayDate(date) {
            date = new Date(date);
            return new Date(date.setDate(date.getDate() - date.getDay() + 7));
        }

        /**
         * returns only date without time in format dd/mm/yyyy
         *
         * @param date
         * @returns {string}
         */
        function getDateWithoutTime(date) {
            return ('0' + date.getDate()).slice(-2) + '/' +
                ('0' + (date.getMonth() + 1)).slice(-2) + '/' +
                date.getFullYear();
        }

        /**
         * returns date with 23:59:59 time
         *
         * @param date
         * @returns {Date}
         */
        function getEndOfDate(date) {
            date = new Date(date);
            date.setHours(23, 59, 59);
            return date;
        }

        /**
         * returns date with 00:00:00 time
         *
         * @param date
         * @returns {Date}
         */
        function getStartOfDate(date) {
            date = new Date(date);
            date.setHours(0, 0, 0);
            return date;
        }
    }
})();
