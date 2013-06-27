class VotesController < ApplicationController

  def index

  end
  
  def show
    
  end

  def new
    @vote = Vote.new
  end

  def create
    question = Question.find(params[:question_id])
    value = params[:value].to_i
    question.votes.create(user_id: current_user.id, value: value)
    redirect_to question_path(question.id)
  end
end
