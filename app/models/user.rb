class User < ActiveRecord::Base

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validate :password_confirmation, presence: true


  #attr_accessor :password, :password_confirmation
end
