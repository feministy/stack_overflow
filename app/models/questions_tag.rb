class QuestionsTag < ActiveRecord::Base
  attr_accessible :question_id, :tag_id

  belongs_to :question
  belongs_to :tag

  validates_uniqueness_of :question_id, scope: :tag_id
end
