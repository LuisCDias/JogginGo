# == Schema Information
#
# Table name: timings
#
#  id           :integer          not null, primary key
#  initial_time :datetime
#  final_time   :datetime
#  global_time  :datetime
#  user_id      :integer
#  track_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Timing < ActiveRecord::Base
  attr_accessible :final_time, :global_time, :initial_time, :track_id, :user_id
  belongs_to :track
  belongs_to :user
  
end
