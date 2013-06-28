class TagsController < ApplicationController

  def index
    @tags = order_tags(Tag.all)
  end

  def show
    @tag = Tag.find(params[:id])
    @questions = @tag.questions 
  end
  
end
