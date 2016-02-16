class KeywordsController < ApplicationController
  before_action :set_website, only: [:create, :update, :destroy]
  before_action :set_keyword, only: [:update, :destroy]

  def new
  end

  def create
    @keyword = @website.keywords.create(keyword_params)
    if @keyword.save
      flash[:success] = 'Website created'
      redirect_to account_website_path(@website.account, @website), success: 'Website created'
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def show
  end

  def update
    if @keyword.check_position
      redirect_to account_website_path(@website.account, @website), success: 'Position updated'
    else
      redirect_to account_website_path(@website.account, @website), error: "That didn't work out."
    end
  end

  def destroy
    @keyword.destroy
    redirect_to account_website_path(@website.account, @website), alert: 'Keyword deleted'
  end

  private

  def set_website
    @website = Website.find(params[:website_id])
  end

  def set_keyword
    @keyword = Keyword.find(params[:id])
  end

  def keyword_params
    params.require(:keyword).permit(:phrase)
  end
end
