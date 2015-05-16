'use strict'

angular.module 'petShelterApp'
.controller 'ViewPetsDetailsCtrl', ($scope, $stateParams, PetsResource, Auth) ->
  userId = Auth.getCurrentUser()._id;
  console.log $stateParams
  $scope.pet = PetsResource.get(userId, $stateParams.id)
