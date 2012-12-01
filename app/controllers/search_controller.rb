class SearchController < ApplicationController
  def index
    @goods = Good.where(["title LIKE '%#{params[:search]}%' AND available=?", true])
  end
end
