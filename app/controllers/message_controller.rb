class MessageController < ApplicationController
  def show
    @room_id = params[:id]
    @messages = Message.recent_in_room(@room_id)
  end

  def create
    @message = Message.new(
      content: params[:content],
      from_user_id: params[:from_user_id],
      room_id: params[:id]
    )
    @message.save
    redirect_to("/message/#{params[:id]}")
  end
end
