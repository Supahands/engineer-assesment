class MessageOfTheDayController < ApplicationController
  before_action :motd_params
  include Response
  def post_message
    motd = MessageOfTheDay.create!(title: params['title'], body: params['body'])
    json_response(motd, :ok)
  end

  def motd_params
    params.permit(:title, :body)
  end
end
