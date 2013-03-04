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

require 'spec_helper'

describe Timing do
  pending "add some examples to (or delete) #{__FILE__}"
end
