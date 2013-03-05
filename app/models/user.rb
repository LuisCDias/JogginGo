# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  name            :string(255)
#  username        :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :remember_token, :username, :password, :password_confirmation
  has_secure_password
  
  has_many :tracks
  has_many :timings
  before_save { |user| user.email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, :length => {maximum: 40}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\.[a-z]+\z/i
  validates :email, presence: true, 
  					:uniqueness => {case_sensitive: false}, 
  					:format => {with: VALID_EMAIL_REGEX}
  validates :username, presence: true, :length => {maximum: 20},
  				:uniqueness => {case_sensitive: false}

  validates :password, :presence => true, :length => {:minimum => 6}, 
            :on => :create
  validates :password_confirmation, :presence => true, 
            :on => :update, :unless => lambda{|user| user.password.blank?}

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
