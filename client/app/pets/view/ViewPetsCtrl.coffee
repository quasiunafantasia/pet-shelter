'use strict'

angular.module 'petShelterApp'
.controller 'ViewPetsCtrl', ($scope, PetsResource, Auth) ->
  id = Auth.getCurrentUser()._id;
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






