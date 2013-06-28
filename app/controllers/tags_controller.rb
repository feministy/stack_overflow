class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    # @tag = Tag.find 
  end
  
end
