class Good < ActiveRecord::Base
  attr_accessible :category_id, :description, :title, :owner_id, :available
  has_many :steps, inverse_of: :good
  belongs_to :owner, class_name: "User"

  has_many :wanters, through: :wants, source: :user
  has_many :wants


  def photo_urls
    steps.map(&:photo_url).collect{|a| a unless a.blank? }.compact
  end

  def photo_url
    photo_urls.first
  end

end
