class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @question = Question.find(params[:comment][:question_id])
    if params[:comment][:target_type] == 'question'
      @target = Question.find(params[:comment][:target_id])
    elsif params[:comment][:target_type] == 'answer'
      @target = Answer.find(params[:comment][:target_id])
    end
    @target_type = params[:comment][:target_type]
  end

  def create
    @question = Question.find(params[:question_id])

    if params[:target_type] == 'question'
      question = Question.find(params[:target_id])
      content = params[:comment][:content]
      question.comments.create(user_id: current_user.id, content: content)
    elsif params[:target_type] == 'answer'
      answer = Answer.find(params[:target_id])
      content = params[:comment][:content]
      answer.comments.create(user_id: current_user.id, content: content)
    end
    redirect_to question_path(@question)
  end

  def edit
    @comment = Comment.find(params[:comment][:comment_id])
    @question = Question.find(params[:comment][:question_id])
  end

  def update
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(content: params[:comment][:content])
      redirect_to question_path(@question)
    else
      render edit_comment_path(@comment)
    end 
  end

  def destroy
    comment = Comment.find(params[:comment][:comment_id])
    question = Question.find(params[:comment][:question_id])
    Comment.destroy(comment)
    redirect_to question_path(question)
  end  
end
