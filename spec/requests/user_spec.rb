require 'spec_helper'

describe User do

  context "on login page" do

    it "should log in the user with correct credentials" do
      User.create(username: "niles", email: "hello@niles.com", password: "123456")
      visit login_path
      fill_in("Username", :with => "niles")
      fill_in("Password", :with => "123456")
      click_button("Login")
      expect(page).to have_content("New Question")
    end
  end

  context "on signup page" do

    it "should create a user given valid inputs" do
      visit signup_path
      fill_in("Username", :with => "niles2")
      fill_in("Email",    :with => "niles@whatwhat.com")
      fill_in("Password", :with => "1234")
      click_button("Create User")
      expect(page).to have_content("New Question")
    end
  end

  context "on logout" do
    it "should successfully log user out" do
      visit new_question_path
      click_link("Logout")
      expect(page).to have_content("Password")
    end
  end

  context "on home page" do
    it "cannot ask question unless logged in" do
      visit root_path
      click_link("Ask a question")
      expect(page).to have_content("Username")
    end
  end
end




