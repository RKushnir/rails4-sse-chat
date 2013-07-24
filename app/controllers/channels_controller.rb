class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end

  def show
    @channel = Channel.find(params[:id])
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.create!(channel_params)
    redirect_to @channel
  end

  private

  def channel_params
    params.require(:channel).permit(:subject)
  end
end
