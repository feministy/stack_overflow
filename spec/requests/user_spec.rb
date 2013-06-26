require 'spec_helper'

describe User do

  # before(:each) do
  # end

  context "on login page" do

    it "should log in the user with correct credentials" do
      User.create(username: "niles", email: "hello@niles.com", password: "123456")
      visit '/login'
      fill_in("Username", :with => "niles")
      fill_in("Password", :with => "123456")
      click_button("Login")
      expect(page).to have_content("New Question")
    end
  end

  context "on signup page" do

    it "should create a user given valid inputs" do
      visit '/signup'
      fill_in("Username", :with => "niles2")
      fill_in("Email",    :with => "niles@whatwhat.com")
      fill_in("Password", :with => "1234")
      click_button("Create User")
      expect(page).to have_content("New Question")
    end
  end

  context "on logout" do
    it "should successfully log user out" do
      visit '/questions/new'
      click_link("Logout")
      expect(page).to have_content("Password")
    end
  end
end


