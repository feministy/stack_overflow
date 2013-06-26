class SessionsController < ApplicationController
  def new; end

  def create 
    # Logs user in
    user = User.find_by_username(params[:session])
    if user && user.authenticate(params[:session])
      session[:current_user_id] = user.id
      redirect_to user
    else 
      render 'new'
    end
  end

  def destroy
    # Logs user out
    session[:current_user_id] = nil
    redirect_to root_url
  end

  private
  def current_user
    @_current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
  end
end
