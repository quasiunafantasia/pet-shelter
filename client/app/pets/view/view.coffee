angular.module 'petShelterApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'pets.view',
    parent: 'pets'
    url: '/view'
    templateUrl: 'app/pets/view/view.html'
    controller: 'ViewPetsCtrl'
    authenticate: true
