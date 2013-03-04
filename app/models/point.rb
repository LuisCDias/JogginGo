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
#

class Point < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :track_id
  belongs_to :track
end
