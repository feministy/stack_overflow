class Question < ActiveRecord::Base
  attr_accessible :title, :content, :user_id 

  belongs_to :user

  has_many :comments, :as => :commentable
  has_many :votes,    :as => :votable
  has_many :questions_tags
  has_many :tags, :through => :questions_tags

  validates_presence_of :title, :content
end
