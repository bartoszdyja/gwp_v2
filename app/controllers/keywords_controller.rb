class KeywordsController < ApplicationController
  before_action :set_website, only: [:create, :update, :destroy]
  before_action :set_keyword, only: [:update, :destroy]

  def new
  end

  def create
    @keyword = Keyword.create(keyword_params)
    if @keyword.save
      flash[:success] = 'Website created'
      redirect_to account_website_path(@website.account, @website), success: 'Website created'
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def show
    @keyword = Keyword.find(params[:id])
    @website = Website.find(params[:website_id])
    @positions = @keyword.positions
  end

  def update
    if @keyword.check_position
      redirect_to account_website_path(@website.account, @website), success: 'Position updated'
    else
      redirect_to account_website_path(@website.account, @website), error: "That didn't work out."
    end
  end

  def destroy
    if @keyword.website.account.user == current_user
      redirect_to account_website_path(@website.account, @website), alert: 'Keyword deleted' if @keyword.destroy
    else
      render plain: 'This is not allowed.'
    end
  end

  private

  def set_website
    @website = Website.find(params[:website_id])
  end

  def set_keyword
    @keyword = Keyword.find_by_id(params[:id])
  end

  def keyword_params
    params.require(:keyword).permit(:phrase).merge(website_id: params[:website_id])
  end
end
