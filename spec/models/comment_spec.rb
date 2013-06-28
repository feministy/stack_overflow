require 'spec_helper'

describe Comment do

  it { should belong_to(:user) }
  it { should belong_to(:commentable) }
  it { should validate_presence_of(:content) }

  before(:each) do
    @count = Comment.all.count
  end

  it "should add a comment to the database when successfully created" do
    FactoryGirl.create(:comment)
    expect(Comment.all.count).to eq(@count+1)
  end

  it "should not create an answer when there is no content" do
    Comment.create(user_id: 1)
    Comment.all.count.should eq(@count)
  end
end
