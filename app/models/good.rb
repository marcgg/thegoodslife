class Good < ActiveRecord::Base
  attr_accessible :category_id, :description, :title, :owner_id
  has_many :steps, inverse_of: :good
  belongs_to :owner, class_name: "User"

  has_many :wanters, through: :wants, source: :user
  has_many :wants


  def photo_urls
    steps.map(&:photo_url).compact
  end

  def photo_url
    photo_urls.first
  end

end
