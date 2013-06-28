require 'spec_helper'

describe Vote do

  it { should belong_to(:user) }
  it { should belong_to(:votable) }
  it { should validate_presence_of(:value) }
  it { should validate_uniqueness_of(:user_id) }

  before(:each) do
    @count = Vote.all.count
  end

  it "should add a vote to the database when successfully created" do
    FactoryGirl.create(:vote)
    expect(Vote.all.count).to eq(@count+1)
  end

  it "should not create a vote when user is not logged in" do
    Vote.create(value: 1)
    Vote.all.count.should eq(@count)
  end

  it "should not create a vote when value is invalid" do
    Vote.create(user_id: 1, value: -2)
    Vote.all.count.should eq(@count)
  end
end
