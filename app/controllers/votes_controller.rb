class VotesController < ApplicationController

  def create
    if params[:type] == 'question'
      question = Question.find(params[:question_id])
      value = params[:value].to_i
      question.votes.create(user_id: current_user.id, value: value)
    elsif params[:type] == 'answer'
      answer = Answer.find(params[:answer_id])
      value = params[:value].to_i
      answer.votes.create(user_id: current_user.id, value: value)
    end

    redirect_to question_path(params[:question_id])
  end
  
end
