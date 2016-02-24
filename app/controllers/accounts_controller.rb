class AccountsController < ApplicationController
  before_action :authenticate_user

  def new
    @account = Account.new
  end

  def create
    @account = current_user.accounts.build(account_params)
    if @account.save
      redirect_to root_path, success: 'Account created'
    else
      flash[:error] = 'User was not created. Please try again'
      render 'new'
    end
  end

  def show
  end

  def index
    @accounts = current_user.accounts
  end

  private

  def account_params
    params.require(:account).permit(:name)
  end
end
