'use strict'

angular.module 'petShelterApp'
.controller 'GetPetDetailsCtrl', ($scope, $stateParams, PetsResource) ->
  $scope.pet = PetsResource.getSearchResult($stateParams.id);

