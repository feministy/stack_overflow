class Answer < ActiveRecord::Base
  attr_accessible :content, :user_id, :question_id

	belongs_to :user
	belongs_to :question

	has_many :comments, :as => :commentable
	has_many :votes,    :as => :votable

	validates_presence_of :content, :user_id, :question_id

end
