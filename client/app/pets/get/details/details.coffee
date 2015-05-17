angular.module 'petShelterApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'pets.get.details',
    parent: 'pets.get'
    url: '/details/:id'
    templateUrl: 'app/pets/get/details/details.html'
    controller: 'GetPetDetailsCtrl'
    authenticate: true
