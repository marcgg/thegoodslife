class Step < ActiveRecord::Base
  attr_accessible :good_id, :location, :message, :owner_id, :photo_url, :winner_id, :type, :affected_date
  belongs_to :winner, class_name: "User"
  belongs_to :owner, class_name: "User"
  belongs_to :good, inverse_of: :steps

  def long
    "2.#{self.id}"
  end

  def lat
    "48.#{self.id}"
  end
end
