class Timing < ActiveRecord::Base
  attr_accessible :final_time, :global_time, :initial_time, :track_id, :user_id
  belongs_to :track
  belongs_to :user
  
end
