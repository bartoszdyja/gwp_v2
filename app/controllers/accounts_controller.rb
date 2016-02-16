class AccountsController < ApplicationController

  def new
    @account = Account.new
  end

  def create
    @account = current_user.accounts.build(account_params)
    if @account.save
      redirect_to root_path, success: 'Account created'
    else
      flash[:error] = 'Name cannot be blank'
      render 'new'
    end
  end

  def show
  end

  def index
  end

  private

  def account_params
    params.require(:account).permit(:name)
  end


end
