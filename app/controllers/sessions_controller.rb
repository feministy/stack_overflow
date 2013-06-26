class SessionsController < ApplicationController
  def new; end

  def create 
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:current_user_id] = @user.id
      redirect_to new_question_path
    else 
      render 'new'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to login_path
  end

  private
  def current_user
    @_current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
  end
end
