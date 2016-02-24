class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email( params[:session][:email] )
    return redirect_to root_path, error: 'Account not active. Please check your email.' unless user.activated
    if user && user.authenticate(user_params[:password])
      login(user)
      redirect_to user_accounts_path(user), success: 'Successfully logged in'
    else
      flash.now[:error] = 'Invalid user / password'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Succesfully logged out'
  end

  private

  def user_params
    params.require(:session).permit(:email, :password)
  end

end
