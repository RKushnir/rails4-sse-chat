require 'reloader/sse'

class MessagesController < ApplicationController
  include ActionController::Live

  before_action :authenticate_user!
  respond_to :js

  def index
    last_check_time = Time.now
    response.headers['Content-Type'] = 'text/event-stream'

    sse = Reloader::SSE.new(response.stream)

    begin
      loop do
        Message.created_after(last_check_time).find_each do |message|
          sse.write(MessageSerializer.new(message), event: 'newMessage')
        end

        last_check_time = Time.now
        sleep 1
      end
    rescue IOError
    ensure
      sse.close
    end
  end

  def create
    respond_with @message = channel.messages.create(message_params)
  end

  private

  def channel
    @channel ||= Channel.find(params[:channel_id])
  end

  def message_params
    params.require(:message).permit(:body).merge(author: current_user)
  end
end
