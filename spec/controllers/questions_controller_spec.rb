require 'spec_helper'

describe QuestionsController do
  render_views
  
  context "renders GET views" do
    it "should render index" do
      get :index
      response.should render_template :index
    end

    it "should render login_path (not new_question_path) if not logged in" do 
      get :new
      response.should redirect_to "/login"
    end   
  end
end
