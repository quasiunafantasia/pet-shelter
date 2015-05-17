'use strict'

angular.module 'petShelterApp'
.controller 'ViewPetsDetailsCtrl', ($scope, $stateParams, $state, PetsResource, Auth) ->
  userId = Auth.getCurrentUser()._id;
  console.log $stateParams
  $scope.pet = PetsResource.get(userId, $stateParams.id)
  $scope.delete = () ->
    PetsResource.delete(userId, $stateParams.id).$promise
    .then(
      () ->
      $scope.$emit('delete');
      $state.go('pets.view')
    );
  $scope.save = () ->
    PetsResource.update(userId, $stateParams.id).$promise
    .then(
      (responce) -> $scope.pet = responce;
    );

