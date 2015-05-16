'use strict'

angular.module 'petShelterApp'
.controller 'ViewPetsDetailsCtrl', ($scope, $stateParams, $state, PetsResource, Auth) ->
  userId = Auth.getCurrentUser()._id;
  console.log $stateParams
  $scope.pet = PetsResource.get(userId, $stateParams.id)
  $scope.euthanize = () ->
    PetsResource.delete(userId, $stateParams.id).$promise
    .then(
      () -> $state.go('pets.view')
    );
  $scope.save = () ->
    PetsResource.update(userId, $stateParams.id).$promise
    .then(
      (responce) -> $scope.pet = responce;
    );

