class User < ActiveRecord::Base
  attr_accessible :bio, :location, :name, :photo_url, :score, :facebook_id

  def self.find_or_create_from_facebook(params)
    User.where(facebook_id: params[:facebook_id]).first ||
    User.create!(params)
  end

end
