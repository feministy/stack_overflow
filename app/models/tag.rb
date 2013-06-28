class Tag < ActiveRecord::Base
  attr_accessible :name

  has_many :questions_tags
  has_many :questions, through: :questions_tags

  validates_presence_of :name
end
