# create the home controller - use this array structure in order to deploy
home = [
  "$scope"
  "$rootScope"
  "$routeParams"
  "$location"
  "$timeout"
  ($scope,$rootScope,$routeParams,$location,$timeout) -> 
    $scope.Players = new Meteor.AngularCollection "players", $scope, false
    $scope.players = $scope.Players.find {}
    $scope.selected = 0
    $scope.score = '-score'
    $scope.name = '+name'
    $scope.addLove = (play) ->
      play.score = play.score + 5
      play.$save()
    $scope.toggleSelect = (i) -> 
      $scope.selected = i
    $scope.sel = (i) ->
      if $scope.selected is i then 'selected' else ''
]

# create app with home route with pushstate 
angular.module('meteorapp', [])
.config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)
  $routeProvider.when '/'
    controller: 'home'
]