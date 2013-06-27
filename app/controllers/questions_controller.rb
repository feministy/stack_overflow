class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end
  
  def show
    @question = Question.find(params[:id])
    @answer = Answer.new(:question_id => @question.id)
  end

  def new
    if current_user
      @question = Question.new
    else
      redirect_to login_path
    end
  end

  def create
    @question = Question.new(params[:question])
    @question.user_id = current_user.id
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

end
