class WebsitesController < ApplicationController
  before_action :authorize_account_owner
  def new
    @website = Website.new
  end

  def create
    @website = Website.new(websites_params)
    @website.account_id = params[:account_id]
    if @website.save
      redirect_to account_websites_path, flash: {success: 'Website added'}
    else
      flash.now[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def show
    @keyword = Keyword.new
    @website = Website.includes(:keywords).find(params[:id])
    # @keywords = @website.keywords
  end

  def index
    @account = Account.find(params[:account_id])
    @websites = @account.websites
  end

  private

  def websites_params
    params.require(:website).permit(:name, :url, :account_id)
  end

  def authorize_account_owner
    render plain: 'not authorized' unless current_user == Account.find(params[:account_id]).user
  end
end
