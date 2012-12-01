class Want < ActiveRecord::Base
  attr_accessible :good_id, :user_id
  belongs_to :good
  belongs_to :user
end
