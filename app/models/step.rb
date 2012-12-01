class Step < ActiveRecord::Base
  attr_accessible :good_id, :location, :message, :owner_id, :photo_url, :winner_id, :type
  belongs_to :winner, class_name: "User"
  belongs_to :owner, class_name: "User"
  belongs_to :good, inverse_of: :steps
end
