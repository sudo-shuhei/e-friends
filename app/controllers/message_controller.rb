class MessageController < ApplicationController
  helper_method :partner?

  def partner?(room_id)
    index = room_id.index("-")
    user1, user2 = room_id[0..index-1], room_id[index+1..-1].to_i
    #puts user1, user2
    if current_user.id == user2
      partner_id = user1
    else
      partner_id = user2
    end
    return User.find_by(id: partner_id)
  end

  def show
    @room_id = params[:id]
    @messages = Message.recent_in_room(@room_id)
    @message = Message.new()
    @partner = partner?(@room_id)
    @notification = Notification.new()
  end

  def create
    @message = Message.new(
      content: params[:content],
      from_user_id: params[:from_user_id],
      to_user_id: partner?(params[:id]).id,
      room_id: params[:id]
    )
    if @message.save
      other_notification = Notification.find_by(
        to_user_id: partner?(params[:id]).id,
        content: "メッセージが届いています",
        post_id: params[:id],
        message_type: "message")
      if other_notification.blank?
        @notification = Notification.new(
          to_user_id: partner?(params[:id]).id,
          content: "メッセージが届いています",
          post_id: params[:id],
          message_type: "message"
        )
        @notification.save
      end
      flash[:notice]= "メッセージを送信しました"
      redirect_to("/message/#{params[:id]}")
    else
      render "message/show"
    end

  end

end
