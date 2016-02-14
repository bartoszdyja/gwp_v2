class KeywordsController < ApplicationController
  def new
  end

  def create
    @website = Website.find(params[:website_id])
    @keyword = @website.keywords.create(keyword_params)
    if @keyword.save
      redirect_to account_website_path(@website.account, @website)
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def show
  end

  def destroy
    Keyword.find(params[:id]).destroy
    @website = Website.find(params[:website_id])
    redirect_to account_website_path(@website.account, @website), flash: {alert: 'Keyword deleted'}
  end

  private

  def keyword_params
    params.require(:keyword).permit(:phrase)
  end
end
