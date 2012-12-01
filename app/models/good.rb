class Good < ActiveRecord::Base
  attr_accessible :category_id, :description, :title, :owner_id
  has_many :steps
end
