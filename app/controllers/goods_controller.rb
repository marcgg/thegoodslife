class GoodsController < ApplicationController
  def show
    @good = Good.find(params[:id])
  end

  def index
  end

  def want
    @good = Good.find(params[:id])
    @good.wanters << current_user unless @good.wanters.include?(current_user)
    redirect_to good_path(@good)
  end
end
