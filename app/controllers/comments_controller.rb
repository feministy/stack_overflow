class CommentsController < ApplicationController
  def index
    # render question_path(id)
  end

  def new
    @comment = Comment.new
  end

  def create
    # Create a new comment
    # Association with question or answer OMG BRAIN
    @comment = Comment.new
    if @comment.save
      redirect_to question_path(question_id)
    else
      render SHIT
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
