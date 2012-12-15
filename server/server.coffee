Players = new Meteor.Collection("players")

Meteor.startup ->
  if Players.find().count() is 0 
    names = [
      "Ada Lovelace"
      "Grace Hopper"
      "Marie Curie"
      "Carl Friedrich Gauss"
      "Nikola Tesla"
      "Claude Shannon"
    ]
    for name in names
      Players.insert
        name: name
        score: Math.floor(Math.random()*10) * 5