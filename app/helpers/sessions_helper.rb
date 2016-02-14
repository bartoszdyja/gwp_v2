module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !session[:user_id].nil?
  end

  def logout
    session[:user_id] = nil
  end
end
