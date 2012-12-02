class Good < ActiveRecord::Base
  attr_accessible :category_id, :description, :title, :owner_id, :available
  has_many :steps, inverse_of: :good, dependent: :destroy, order: 'affected_date DESC'
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

  def latest_deal
    steps.detect(&:open?)
  end

  def locations
    steps.map {|step| Location.new(step.long, step.lat) }
  end

  def current_location
    locations.last
  end


  def geo_points
    locations.map {|step|
      {
        geometry: {
          type: 'Point',
          coordinates: [step.long, step.lat]
        },
        properties: {
          image: '//d7q85mn3faw4b.cloudfront.net/clients/popmarket/offre-decouverte/map-marker.png'
        }
      }
    }
  end

  Location = Struct.new(:long, :lat)

end
