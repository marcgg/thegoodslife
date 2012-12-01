class StepsController < ApplicationController
  def new
  end

  def show
  end

  def index
    @deals = Steps::Deal.all
  end

  def create
    Good.create!(
      description: params[:good_description],
      title: params[:title],
      category: params[:category]
    )
  end
end
