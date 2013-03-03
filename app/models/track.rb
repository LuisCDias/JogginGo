class Track < ActiveRecord::Base
  attr_accessible :city, :country, :name, :user_id, :private, :approved
  belongs_to :user
  has_many :timings

  
end
