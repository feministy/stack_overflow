class Vote < ActiveRecord::Base
  attr_accessible :value

  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates_presence_of :value
end
