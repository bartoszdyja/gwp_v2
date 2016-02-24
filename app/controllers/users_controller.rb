class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver
      redirect_to root_path, notice: 'Account created. Please check your email for further instruction'
    else
      flash.now[:error] = 'Cannot save user'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @accounts = current_user.try(:accounts)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_accounts_path(@user)
  end

  def activate
    begin
      user = User.find_by_email(params[:email])
      token = Base64.decode64(params[:id])
      return false unless BCrypt::Password.new(token).is_password?(user.id)
      user.update(activated: true)
      login(user)
      redirect_to user_accounts_path(user), success: 'You have activated your account'
    rescue
      flash[:error] = 'Something went wrong'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,
                                 :first_name,
                                 :last_name,
                                 :password,
                                 :password_confirmation)
  end
end
