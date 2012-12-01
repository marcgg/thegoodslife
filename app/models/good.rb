class Good < ActiveRecord::Base
  attr_accessible :category_id, :description, :title, :owner_id
  has_many :steps

  def photo_urls
    steps.map(&:photo_url)
  end
end
