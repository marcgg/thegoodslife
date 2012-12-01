class User < ActiveRecord::Base
  attr_accessible :bio, :location, :name, :photo_url, :score, :facebook_id

  has_many :won_deals, class_name: "Steps::Deal",
    foreign_key: :winner_id
  has_many :offered_deals, class_name: "Steps::Deal",
    foreign_key: :owner_id,
    conditions: 'winner_id IS NOT NULL'
  has_many :available_deals, class_name: "Steps::Deal",
    foreign_key: :owner_id,
    conditions: 'winner_id IS NULL'


  has_many :won_goods, through: :won_deals, source: :good
  has_many :offered_goods, through: :offered_deals, source: :good
  has_many :available_goods, through: :available_deals, source: :good

  has_many :wanted_goods, through: :wants, source: :good
  has_many :wants

  def photo_url
    "http://graph.facebook.com/#{facebook_id}/picture"
  end

  def self.find_or_create_from_facebook(params)
    User.where(facebook_id: params[:facebook_id]).first ||
    User.create!(params)
  end

  def score
    42
  end

end
