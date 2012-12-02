class GoodsController < ApplicationController
  def show
    @good = Good.find(params[:id])
    @my_points = "["
    data = @good.steps.map do |step| 
      "{'geometry': { 
      'type': 'Point', 'coordinates': [#{step.long}, #{step.lat}]}, 
      'properties': { 'image': '//d7q85mn3faw4b.cloudfront.net/clients/popmarket/offre-decouverte/map-marker.png' }
      }"
    end
    @my_points += data.join(",")
    @my_points += "]"
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
