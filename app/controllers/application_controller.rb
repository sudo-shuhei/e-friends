class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_notification

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :profile])
  end

  def after_sign_in_path_for(resource)
    "/users/#{current_user.id}/show"
  end

  def after_sign_out_path_for(resource)
    "/"
  end

  def sign_in_required
    if not user_signed_in?
      flash[:notice] = "ログインが必要です"
      redirect_to new_user_session_url unless user_signed_in?
    end
  end

  def check_notification
    if user_signed_in?
      #confirmed_notifications = Notification.where(status: "confirmed")
      #confirmed_notifications.destroy_all
      @notifications = Notification.where(to_user_id: current_user.id)
    end
  end

  def message_room_id(first_user_id, second_user_id)
    if first_user_id < second_user_id
      "#{first_user_id}-#{second_user_id}"
    else
      "#{second_user_id}-#{first_user_id}"
    end
  end
end
