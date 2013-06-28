require 'spec_helper'

describe UsersController do
  render_views
  
  context "renders GET views" do
    it "should render index" do
      get :index
      response.should render_template :index
    end

    it "should render new" do 
      get :new
      response.should render_template :new
    end 

    it "should render show" do
      user = FactoryGirl.create(:user)
      get :show, id: user
      response.should render_template :show
    end
  end
end
