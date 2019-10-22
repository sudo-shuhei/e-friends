class NotificationController < ApplicationController
  def show
    @notification = Notification.find_by(id:params[:id])
    type = @notification.message_type
    if type == "message"
      @notification.destroy
      redirect_to "/message/#{@notification.post_id}"
    elsif type == "accepted"
      @notification.destroy
      redirect_to "/posts/#{@notification.post_id}"
    #@post = Post.find_by(id: @notification.post_id)
    end
  end
end
