class SearchController < ApplicationController
  def index
    @goods = Good.where(["title ILIKE '%#{params[:search]}%' AND available=?", true]).order("created_at DESC")
  end
end
