App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
  # Called when the subscription is ready for use on the server

  disconnected: ->
  # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.message.blank?
      alert data.message
      $(document).on 'turbolinks:load', ->
        $('#message-block').innerHTML(data.message)
      #        $('#messages-table').append data.message
      #scroll_bottom()

$(document).on 'turbolinks:load', ->
  return unless $(".welcome.index").length > 0
  App.Channels.Room.subscribe($('body').data('room-name'))
  #submit_message()
  #scroll_bottom()

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey
      $('input').click()
      event.target.value = ""
      event.preventDefault()

scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)