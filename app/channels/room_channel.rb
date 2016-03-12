# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
    client = TweetStream::Client.new
    client.track('kaumo', 'カウモ', 'かうも') do |status|
      Message.create!(content: status.text, image_url: status.user.profile_image_url, username: status.user.name, screen_name: status.user.screen_name)
      ActiveRecord::Base.connection.close
    end
  end
end
