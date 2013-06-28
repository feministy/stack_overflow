class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end
  
  def show
    @question = Question.find(params[:id])
    @answer = Answer.new(:question_id => @question.id)
    @vote = Vote.new
    @comment = Comment.new
  end

  def new
    if current_user
      @question = Question.new
    else
      redirect_to login_path
    end
  end

  def create
    @question = Question.new(title: params[:question][:title], content: params[:question][:content])
    @question.user_id = current_user.id

    if @question.save
      tag_array = parse_tags(params[:question][:tags])
      tag_array.each do |tag| 
        @question.tags << Tag.find_or_create_by_name(tag) 
      end
      redirect_to questions_path
    else
      render :new
    end
  end

end
