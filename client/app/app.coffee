app = angular.module 'meteorapp', []
TournamentCtrl = ($scope) -> 
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