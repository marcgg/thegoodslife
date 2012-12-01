class Step < ActiveRecord::Base
  attr_accessible :good_id, :location, :message, :owner_id, :photo_url, :winner_id, :type
  belongs_to :user
end
