class Step < ActiveRecord::Base
  attr_accessible :good_id, :location, :message, :owner_id, :photo_url, :winner_id, :type, :affected_date, :lat, :long
  belongs_to :winner, class_name: "User"
  belongs_to :owner, class_name: "User"
  belongs_to :good, inverse_of: :steps

  def long
    super || "#{rand 10}.#{rand(100000)}"
  end

  def lat
    super || "#{ 25 +rand(10)}.#{rand(100000)}"
  end

  def open?
    false
  end
end
