class VotesController < ApplicationController

  def index

  end
  
  def show
    
  end

  def new
    @vote = Vote.new
  end

  def create
    if current_user
      question = Question.find_by_id(params[:question_id])
      user_id = current_user.id
      question.votes << Vote.create(user_id: user_id)
      redirect_to question_path(question.id)
    else
      
  end

end
