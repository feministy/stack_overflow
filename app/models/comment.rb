class Comment < ActiveRecord::Base
  attr_accessible :content  

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates_presence_of :content
end
