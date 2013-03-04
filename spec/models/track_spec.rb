# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  city       :string(255)
#  country    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  private    :boolean          default(TRUE)
#  approved   :boolean          default(TRUE)
#

require 'spec_helper'

describe Track do
 
end
