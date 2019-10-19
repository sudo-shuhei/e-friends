class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :profile])
  end

  def after_sign_in_path_for(resource)
    users_show_path
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

  def request_permitted_parameters
    params.permit(:from_user_id)
  end
end
