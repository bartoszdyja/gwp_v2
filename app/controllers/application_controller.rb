class ApplicationController < ActionController::Base
  add_flash_types :success, :error
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Auth
  helper_method :user_signed_in?
  helper_method :current_user

  def authenticate_user
    redirect_to login_path, error: 'You need to sign in.' if current_user.try(:id) != params[:user_id].to_i
  end
end
