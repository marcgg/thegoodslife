class StepsController < ApplicationController
  def new
    @categories = ["Antiques","Art","Baby","Books","Business & Industrial","Cameras & Photo","Cell Phones & PDAs","Clothing, Shoes & Accessories","Coins & Paper Money","Collectibles","Computers & Networking","Consumer Electronics","Crafts","Dolls & Bears","DVDs & Movies","Entertainment Memorabilia","Gift Certificates","Health & Beauty","Home & Garden","Jewelry & Watches","Music","Musical Instruments","Pottery & Glass","Real Estate","Specialty Services","Sporting Goods","Sports Mem, Cards & Fan Shop","Stamps","Tickets","Toys & Hobbies","Travel","Video Games","Everything Else"]
    @good = Good.where(id: params[:good_id]).first
  end

  def show
  end

  def index
    @deals = Steps::Deal.all
  end

  def create
    affected = Time.parse("#{params["affected_date(1i)"]}-#{params["affected_date(2i)"]}-#{params["affected_date(3i)"]}")
    good = nil
    if params[:good_id].present?
      good = Good.find(params[:good_id])
      good.update_attributes(
        description:  params[:good_description],
        title:        params[:title],
        available:    true
      )
    else
      good = Good.create!(
        description:  params[:good_description],
        title:        params[:title],
        category_id:  params[:category_id],
        owner_id:     params[:owner_id]
      )
    end

    deal = Steps::Deal.create!(
      message:      params[:message],
      location:     params[:location],
      photo_url:    params[:photo_url],
      owner_id:     params[:owner_id],
      good_id:      good.id
    )

    milestone_params = params[:milestone] || {}
    if milestone_params[:message].present?
      affected = Time.parse("#{milestone_params["affected_date(1i)"]}-#{milestone_params["affected_date(2i)"]}-#{milestone_params["affected_date(3i)"]}")

      milestone = Steps::Milestone.create!(
        message:       milestone_params[:message],
        location:      milestone_params[:location],
        photo_url:     milestone_params[:photo_url],
        owner_id:      params[:owner_id],
        good_id:       good.id,
        affected_date: affected
      )
    end

    redirect_to good_path(good)
  end
end
