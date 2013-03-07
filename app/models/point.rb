# == Schema Information
#
# Table name: points
#
#  id         :integer          not null, primary key
#  latitude   :float
#  longitude  :float
#  track_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address    :string(255)
#

class Point < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :address, :track_id
  belongs_to :track

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

end
