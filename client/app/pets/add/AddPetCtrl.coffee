'use strict'

angular.module 'petShelterApp'
.controller 'AddPetCtrl', ($scope, PetsResource, Auth) ->
  id = Auth.getCurrentUser()._id;
  $scope.pet = {
    tags: []
  };
  $scope.addTag = (tag) ->
    if tag.length and ($scope.pet.tags.indexOf(tag) == -1)
      $scope.pet.tags.push tag;
    $scope.currentTag = '';
  $scope.removeTag = (tagIndex) ->
    $scope.pet.tags.splice tagIndex, 1;
  $scope.addPet = () ->
    PetsResource.save(id, $scope.pet).$promise
    .then(
        (responce) -> console.log('success', responce);
        (responce) -> console.log('err', responce);
    );


