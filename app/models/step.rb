class Step < ActiveRecord::Base
  attr_accessible :good_id, :location, :message, :owner_id, :photo_url, :winner_id, :type, :affected_date, :lat, :long
  belongs_to :winner, class_name: "User"
  belongs_to :owner, class_name: "User"
  belongs_to :good, inverse_of: :steps

  def long
    super || "2.#{self.id * 2}"
  end

  def lat
    super || "48.#{self.id * 4}"
  end

  def open?
    false
  end
end
