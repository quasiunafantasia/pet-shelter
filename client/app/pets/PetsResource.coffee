'use strict'

angular.module 'petShelterApp'
.service 'PetsResource', ($resource) ->
  res = $resource('/api/user/:userId/pet/:petId', {}, {
    update: {
      method: 'PUT'
    }
    });
  {
    query: (userId) ->
      res.query({userId});
    get: (userId, petId) ->
      res.get({userId, petId});
    save: (userId, pet) ->
      res.save(angular.extend({userId}, pet));
    update: (userId, pet) ->
      res.update(angular.extend({userId}, pet));
    delete: (userId, petId) ->
      res.delete({userId, petId});
  }

