class Question < ActiveRecord::Base
  
  attr_accessible :title, :content  

  belongs_to :user

  validates_presence_of :title, :content
end
