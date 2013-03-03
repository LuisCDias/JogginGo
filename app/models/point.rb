class Point < ActiveRecord::Base
  attr_accessible :N, :W, :track_id
  belongs_to :track
end
