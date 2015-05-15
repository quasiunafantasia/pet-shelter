'use strict'

angular.module 'petShelterApp'
.controller 'LoginCtrl', ($scope, Auth, $location, $window, $state) ->
  $scope.user = {}
  $scope.errors = {}
  $scope.login = (form) ->
    $scope.submitted = true

    if form.$valid
      # Logged in, redirect to home
      Auth.login
        email: $scope.user.email
        password: $scope.user.password

      .then ->
        $state.go 'pets'

      .catch (err) ->
        $scope.errors.other = err.message

  $scope.loginOauth = (provider) ->
    $window.location.href = '/auth/' + provider
