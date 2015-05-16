'use strict'

angular.module 'petShelterApp'
.controller 'ViewPetsCtrl', ($scope, $state, PetsResource, Auth) ->
  id = Auth.getCurrentUser()._id;

  $scope.isListDisplayed = () -> $state.current.name == 'pets.view';

  console.log $scope.isListDisplayed;
  getHappinessStatus = (level) ->
    status = switch
      when level < 45 then 'danger'
      when level < 50 then 'warning'
      when level < 70 then 'info'
      else 'success'

  PetsResource.query(id).$promise
    .then(
        (responce) ->
          $scope.pets = responce.map((pet) ->
            pet.happinessStatus = getHappinessStatus(pet.happiness);
            return pet;
          );
        (responce) -> console.log('err', responce);
    );

  $scope.showWarning = (level) -> level < 50;






