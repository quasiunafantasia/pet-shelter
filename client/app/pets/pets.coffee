angular.module 'petShelterApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'pets',
    url: '/pets'
    templateUrl: 'app/pets/pets.html'
    controller: 'PetsCtrl'
    authenticate: true
