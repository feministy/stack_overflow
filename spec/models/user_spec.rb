require 'spec_helper'

describe User do

  before(:each) do
    @count = User.all.count
  end

  it { should have_many(:questions) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }
  it { should_not allow_value("blah").for(:email) }
  it { should allow_value("abc@abc.com").for(:email) }

  context "with invalid input" do
    it "should not save user to database when one or more fields are empty" do
      User.create(username: 'george')
      expect(User.all.count).to eq(@count)
    end

    it "should not create a user when email address is invalid format" do
      User.create(username: "henry", email: "henry@a.c", password: "abcde3")
      User.all.count.should eq(@count)
    end

    it "should not create a user if username/email is already taken" do
      FactoryGirl.create(:user)
      User.create(username: "niles", email: "niless@neville.com", password: "1234")
      User.create(username: "niless", email: "niles@neville.com", password: "1234")
      User.all.count.should eq(@count+1)
    end
  end

  context "with valid input" do
    it "should add a user to the database when created" do
      FactoryGirl.create(:user)
      User.all.count.should eq(@count+1)
    end
  end

end
