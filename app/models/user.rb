class User < ActiveRecord::Base
  has_many :questions

  has_secure_password

  attr_accessible :username, :email, :password

  validates :username, uniqueness: true
  validates :email,    uniqueness: true
  validates :email,    format: { :with => /[a-z0-9]+@[a-z0-9]{2,}\.[a-z]{2,}/i,
    message: "Invalid email address. Please try again." }
end
