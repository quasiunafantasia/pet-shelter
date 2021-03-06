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
      createRes(userId).query();
    get: (userId, petId) ->
      createRes(userId, petId).get();
    save: (userId, pet) ->
      createRes(userId).save(pet);
    update: (userId, petId, pet) ->
      createRes(userId, petId).update(pet);
    delete: (userId, petId) ->
      createRes(userId, petId).delete();
    search: (params) ->
      createRes('all').query(params)
    getSearchResult: (id) ->
      createRes('all', id).get();
    updateSearchResult: (id, params) ->
      createRes('all', id).update(params);
    takePet: (userId, petId) ->
      createRes('all', petId).update({master: userId});
  }

