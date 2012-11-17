# create app with home route 
angular.module('meteorapp', ['controllers']).config ['$routeProvider', (e) ->
  e.when '/'
    controller: 'home'
]

# create home route 
angular.module('controllers', []).controller 'home', ['$scope', (e) ->
  e.Players = new Meteor.AngularCollection "players", e, false
  e.players = e.Players.find {}
  e.selected = 0
  e.score = '-score'
  e.name = '+name'
  e.reset = (players) ->
    for play in players 
      play.score = 0
      play.$save()
  e.addLove = (play) ->
    play.score = play.score + 5
    play.$save()
  e.toggleSelect = (i) ->
    e.selected = i
  e.sel = (i) ->
    if e.selected is i then 'selected' else ''
]