class Good < ActiveRecord::Base
  attr_accessible :category_id, :description, :title, :owner_id, :available
  has_many :steps, inverse_of: :good, dependent: :destroy
  belongs_to :owner, class_name: "User"

  has_many :wanters, through: :wants, source: :user
  has_many :wants, dependent: :destroy


  def photo_urls
    steps.map(&:photo_url).collect{|a| a unless a.blank? }.compact
  end

  def photo_url
    photo_urls.first
  end

  def all_locations_count
    Step.where(good_id: self.id).count("location")
  end

  def all_owners_count
    Steps::Deal.where(good_id: self.id).count("owner_id")
  end

  def all_milestones_count
    Steps::Milestone.where(good_id: self.id).count
  end

end
