App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->

  disconnected: ->
# Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    $('#messages').prepend data['message']

  speak: ->
    @perform 'speak'

$ ->
  App.room.speak()