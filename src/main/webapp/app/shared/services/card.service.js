(function(){
    'use strict';
    var HATEOAS_URL = './api/cards';
    angular
        .module('app.bop')
        .factory('Card', Card);

    Card.$inject = ['$http','SpringDataRestAdapter'];

    function Card($http,SpringDataRestAdapter){
        //return $resource('api/cards/:id',{},
        //    {
        //        'update': {method: 'PUT', params: {id: '@id'}}
        //    }
        //);

        function Card(card) {

            if (card._resources) {
                card.resources = card._resources("self", {}, {
                    update: {
                        method: 'PUT'
                    }
                });
                card.save = function(callback) {
                    card.resources.update(card, function() {
                        callback && callback(card);
                    });
                };

                card.remove = function(callback) {
                    card.resources.remove(function() {
                        callback && callback(card);
                    });
                };
            } else {
                card.save = function(callback) {
                    Card.resources.save(card, function(item, headers) {
                        var deferred = $http.get(headers().location);
                        return SpringDataRestAdapter.process(deferred,'_allLinks').then(function(newCard) {
                            callback && callback(new Card(newCard));
                        });
                    });
                };
            }

            return card;
        }


        Card.query = function(params,callback) {
            var deferred = $http.get(HATEOAS_URL,{
                params: params
            });
            return SpringDataRestAdapter.process(deferred,'_allLinks').then(function(data) {
                Card.resources = data._resources('self');
                callback && callback(_.map(data, function(card) {
                    return new Card(card);
                }));
            });
        };

        Card.resources = null;

        return Card;
    }
})();