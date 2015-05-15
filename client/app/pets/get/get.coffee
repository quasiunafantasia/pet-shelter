angular.module 'petShelterApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'pets.get',
    parent: 'pets'
    url: '/get'
    templateUrl: 'app/pets/get/get.html'
    controller: 'GetPetCtrl'
    authenticate: true
