class GoodsController < ApplicationController
  def show
    @good = Good.find(params[:id])
  end

  def index
  end

  def give
    @good = Good.find(params[:id])
    deal = @good.latest_deal
    deal.update_attribute(:winner_id, params[:to])
    @good.update_attributes!(
      owner_id: params[:to],
      available: false
    )
    Want.where(good_id: @good.id).delete_all
    redirect_to dashboard_path
  end

  def want
    @good = Good.find(params[:id])
    @good.wanters << current_user unless @good.wanters.include?(current_user)
    redirect_to good_path(@good)
  end
end
