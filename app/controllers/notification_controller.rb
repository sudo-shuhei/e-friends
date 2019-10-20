class NotificationController < ApplicationController
  def show
    @notification = Notification.find_by(id:params[:id])
    #@notification.status = "confirmed"
    #@notification.save
    @notification.destroy
    @post = Post.find_by(id: @notification.post_id)
  end
end
