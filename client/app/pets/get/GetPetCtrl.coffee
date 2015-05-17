'use strict'

angular.module 'petShelterApp'
.controller 'GetPetCtrl', ($scope, $state, PetsResource) ->
  $scope.isListDisplayed = () -> $state.current.name == 'pets.get';
  $scope.searchParams = {};
  $scope.pets = PetsResource.search();
  containsTag = (tags, xtag) ->
    (tags || []).some((tag) ->
      tag.indexOf(xtag) != -1;
    );
  $scope.isPetDisplayed = (pet) ->
    containsName =  if $scope.searchParams.name
    then new RegExp($scope.searchParams.name, 'i').test(pet.name)
    else true;
    containsTag =  if $scope.searchParams.tag then pet.tags.some((tag) -> new RegExp($scope.searchParams.tag, 'i').test(tag))
    else true;
    containsTag and containsName;
