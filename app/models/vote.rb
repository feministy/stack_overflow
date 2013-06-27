class Vote < ActiveRecord::Base
  attr_accessible :value, :user_id

  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates_presence_of :value
  validates_uniqueness_of :user_id, :scope => [:votable_type, :votable_id]
end
