'use strict'

angular.module 'petShelterApp'
.controller 'GetPetDetailsCtrl', ($scope, $stateParams, PetsResource, Auth) ->
  id = Auth.getCurrentUser()._id;
  $scope.pet = PetsResource.getSearchResult($stateParams.id);
  $scope.take = () ->
    PetsResource.takePet(id, $stateParams.id);


