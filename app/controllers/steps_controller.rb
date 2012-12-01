class StepsController < ApplicationController
  def new
  end

  def show
  end

  def index
    @deals = Steps::Deal.all
  end

  def create
    good = Good.create!(
      description:  params[:good_description],
      title:        params[:title],
      category_id:  params[:category_id],
      owner_id:     params[:owner_id]
    )

    deal = Steps::Deal.create!(
      message:      params[:message],
      location:     params[:location],
      photo_url:    params[:photo_url],
      owner_id:     params[:owner_id],
      good_id:      good.id
    )

    milestone = Steps::Milestone.create!(
      message:      params[:ml_message],
      location:     params[:ml_location],
      photo_url:    params[:photo_url],
      owner_id:     params[:owner_id],
      good_id:      good.id
    )

    redirect_to good_path(good)
  end
end
