class Point < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :track_id
  belongs_to :track
end
