# create app with home route 
angular.module('meteorapp', ['controllers']).config ['$routeProvider', ($routeProvider) ->
    $routeProvider.when '/'
      controller: 'home'
  ]

# create home route 
angular.module('controllers', []).controller 'home', ($scope) ->
  $scope.Players = new Meteor.AngularCollection "players", $scope, false
  $scope.players = $scope.Players.find {}
  $scope.selected = 0
  $scope.score = '-score'
  $scope.name = '+name'
  $scope.reset = (players) ->
    for play in players 
      play.score = 0
      play.$save()
  $scope.addLove = (play) ->
    play.score = play.score + 5
    play.$save()
  $scope.toggleSelect = (i) ->
    $scope.selected = i
  $scope.sel = (i) ->
    if $scope.selected is i then 'selected' else ''