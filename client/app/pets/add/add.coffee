angular.module 'petShelterApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'pets.add',
    parent: 'pets'
    url: '/add'
    templateUrl: 'app/pets/add/add.html'
    controller: 'AddPetCtrl'
    authenticate: true
