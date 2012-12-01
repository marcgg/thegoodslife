class GoodsController < ApplicationController
  def show
    @good = Good.find(params[:id])
  end

  def index
  end

  def give
    @good = Good.find(params[:id])
    deal = Steps::Deal.where(good_id: @good.id).order("created_at DESC").last
    deal.update_attribute(:winner_id, params[:to])
    @good.update_attributes(
      owner_id: params[:to],
      available: false
    )
    redirect_to dashboard_user_path(current_user)
  end

  def want
    @good = Good.find(params[:id])
    @good.wanters << current_user unless @good.wanters.include?(current_user)
    redirect_to good_path(@good)
  end
end
