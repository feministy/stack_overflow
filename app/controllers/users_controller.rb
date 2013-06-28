class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to new_question_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      render :edit
    else
      redirect_to root_url
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to user_path
  end

end
