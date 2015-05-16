angular.module 'petShelterApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'pets.view.details',
    parent: 'pets.view'
    url: '/details/:id'
    templateUrl: 'app/pets/view/details/details.html'
    controller: 'ViewPetsDetailsCtrl'

    authenticate: true
