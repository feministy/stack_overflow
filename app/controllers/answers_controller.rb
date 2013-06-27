class AnswersController < ApplicationController
  def index
    # render question_path(id)
  end

  def new
    @answer = Answer.new
  end

  def create
    content = params[:answer][:content]
    question_id = params[:question_id]
    user_id = current_user.id
    @answer = Answer.new(content: content, question_id: question_id, user_id: user_id)
    if @answer.save
      redirect_to question_path(question_id)
    else
      redirect_to questions_path
    end
  end

  def edit
    # edit own answer
  end

  def show
    # single answer with question
  end

  def update
    # update answer with edits
  end

  def destroy
    # delete own answer
  end
end
