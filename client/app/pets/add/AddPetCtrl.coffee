'use strict'

angular.module 'petShelterApp'
.controller 'AddPetCtrl', ($scope, PetsResource, Auth) ->
  id = Auth.getCurrentUser()._id;
  $scope.pet = {
    tags: []
  };

  $scope.addPet = () ->
    PetsResource.save(id, $scope.pet).$promise
    .then(
        (responce) -> console.log('success', responce);
        (responce) -> console.log('err', responce);
    );


