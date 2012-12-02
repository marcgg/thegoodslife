require 'open-uri'

class SearchController < ApplicationController
  def index
    @goods = Good.where(["title ILIKE '%#{params[:search]}%' AND available=?", true]).order("created_at DESC")
  end

  def geocoder
    render text: open("http://maps.googleapis.com/maps/api/geocode/json?address=#{CGI.escape(params[:s])}&sensor=false").read
  end
end
