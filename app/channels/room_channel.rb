class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream to everyone
    stream_from "room_channel"
    # stream to a single user
    stream_from "room_channel#{message_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
