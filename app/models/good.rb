class Good < ActiveRecord::Base
  attr_accessible :category_id, :description, :title, :owner_id
  has_many :steps
  belongs_to :owner, class_name: "User"

  def photo_urls
    steps.map(&:photo_url)
  end

  def want_possible?
    
  end
end
