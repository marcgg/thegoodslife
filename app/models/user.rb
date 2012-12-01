class User < ActiveRecord::Base
  attr_accessible :bio, :location, :name, :photo_url, :score
end
