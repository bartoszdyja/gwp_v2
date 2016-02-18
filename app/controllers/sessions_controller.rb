class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(user_params[:password])
      login(user)
      redirect_to root_path, success: 'Successfully logged in'
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
