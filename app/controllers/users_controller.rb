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
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end
end
