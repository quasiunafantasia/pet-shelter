'use strict'

angular.module 'petShelterApp'
.controller 'GetPetCtrl', ($scope, $state, PetsResource) ->
  $scope.isListDisplayed = () -> $state.current.name == 'pets.get';
  $scope.searchParams = {};
  $scope.pets = [];
  $scope.searchEnabled = () -> $scope.searchParams.name || $scope.searchParams.tag;
  $scope.search = () ->
    $scope.pets = PetsResource.search($scope.searchParams);

