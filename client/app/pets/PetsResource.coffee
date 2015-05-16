'use strict'

angular.module 'petShelterApp'
.service 'PetsResource', ($resource) ->
  createRes = (userId, petId) ->
    res = $resource('/api/users/:userId/pets/:petId', {userId, petId}, {
      update: {
        method: 'PUT'
      }
      });
  {
    query: (userId) ->
      createRes(userId).query({userId});
    get: (userId, petId) ->
      createRes(userId, petId).get({userId, petId});
    save: (userId, pet) ->
      createRes(userId).save(angular.extend({userId}, pet));
    update: (userId, pet) ->
      res.update(angular.extend({userId}, pet));
    delete: (userId, petId) ->
      createRes(userId, petId).delete({userId, petId});
  }

