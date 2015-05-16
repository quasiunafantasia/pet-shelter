angular.module("petShelterApp")
  .directive "petinfo",  () ->
    {
      restrict: "E"
      scope: {
        pet: "=pet"
      }
    templateUrl: 'app/pets/petDetails.html'
    link: (scope) ->
        console.log 'pets directive';
        scope.pet.tags = scope.pet.tags || [];
    }

