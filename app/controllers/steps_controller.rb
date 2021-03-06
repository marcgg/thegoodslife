class StepsController < ApplicationController
  def new
    @categories = ["Antiques","Art","Baby","Books","Business & Industrial","Cameras & Photo","Cell Phones & PDAs","Clothing, Shoes & Accessories","Coins & Paper Money","Collectibles","Computers & Networking","Consumer Electronics","Crafts","Dolls & Bears","DVDs & Movies","Entertainment Memorabilia","Gift Certificates","Health & Beauty","Home & Garden","Jewelry & Watches","Music","Musical Instruments","Pottery & Glass","Real Estate","Specialty Services","Sporting Goods","Sports Mem, Cards & Fan Shop","Stamps","Tickets","Toys & Hobbies","Travel","Video Games","Everything Else"]
    @good = Good.where(id: params[:good_id]).first
  end

  def show
    @step = Step.find params[:id]
  end

  def update
    @step = Step.find params[:id]
    @step.update_attributes params[:step]
    redirect_to @step.good
  end

  def index
    @deals = Steps::Deal.all
  end

  def create
    good = nil
    if params[:good_id].present?
      good = Good.find(params[:good_id])
      good.update_attributes(
        description:  params[:good_description],
        title:        params[:title],
        available:    true
      )
    else
      if params[:add_milestone_to_good].blank?
        good = Good.create!(
          description:  params[:good_description],
          title:        params[:title],
          category_id:  params[:category_id],
          owner_id:     current_user.id
        )
      else
        good = Good.find(params[:add_milestone_to_good])
      end
    end

    if params[:add_milestone_to_good].blank?
      deal = Steps::Deal.create!(
        message:      params[:message],
        location:     params[:location],
        lat:          params[:lat],
        long:         params[:long],
        photo_url:    params[:photo_url],
        owner_id:     current_user.id,
        good_id:      good.id
      )
      flash[:new_deal] = true
    end


    milestone_params = params[:milestone]
    if milestone_params[:message].present?
      affected = Time.parse("#{milestone_params["affected_date(1i)"]}-#{milestone_params["affected_date(2i)"]}-#{milestone_params["affected_date(3i)"]}")

      milestone = Steps::Milestone.create!(
        message:       milestone_params[:message],
        location:      milestone_params[:location],
        lat:           milestone_params[:lat],
        long:          milestone_params[:long],
        photo_url:     milestone_params[:photo_url],
        owner_id:      current_user.id,
        good_id:       good.id,
        affected_date: affected
      )
    end

    redirect_to good_path(good)
  end
end
