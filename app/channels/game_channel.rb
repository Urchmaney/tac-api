class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'game'
  end
 end