require 'spec_helper'

describe "A user can" do

  context "on login page" do

    it "log in the user with correct credentials" do
      FactoryGirl.create(:user)
      visit login_path
      fill_in("Username", :with => "niles")
      fill_in("Password", :with => "1234")
      click_button("Login")
      expect(page).to have_content("New Question")
    end
  end

  context "on signup page" do

    it "create a user given valid inputs" do
      visit signup_path
      fill_in("Username", :with => "niles2")
      fill_in("Email",    :with => "niles@whatwhat.com")
      fill_in("Password", :with => "1234")
      click_button("Create User")
      expect(page).to have_content("New Question")
    end
  end

  it "successfully log out" do
    visit new_question_path
    click_link("Logout")
    expect(page).to have_content("Password")
  end

  context "on home page" do
    it "cannot ask question unless logged in" do
      visit root_path
      click_link("Ask a question")
      expect(page).to have_content("Username")
    end

    it "can ask question once logged in" do
      visit root_path
      FactoryGirl.create(:user)
      click_link("Login")
      fill_in("Username", :with => "niles")
      fill_in("Password", :with => "1234")
      click_button("Login")
      expect(page).to have_content("New Question")
    end
  end
end




