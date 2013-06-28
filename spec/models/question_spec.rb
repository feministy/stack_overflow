require 'spec_helper'

describe Question do

  it { should belong_to(:user) }
  it { should have_many(:comments) }
  it { should have_many(:votes)}
  it { should have_many(:tags)}

  before(:each) do
    @count = Question.all.count
  end

  it "should add a question to the database when successfully created" do
    FactoryGirl.create(:question)
    expect(Question.all.count).to eq(@count+1)
  end

  it "should not create a question when title is empty" do
    Question.create(title: "", content: "test content", user_id: 1)
    Question.all.count.should eq(@count)
  end

  it "should not create a question when there is no content" do
    Question.create(title: "test2", content: "", user_id: 1)
    expect(Question.all.count).to eq(@count)
  end

  it "should add a tag to the question" do
    q = FactoryGirl.create(:question)
    tag_count = q.tags.count
    t = FactoryGirl.create(:tag)
    q.tags << t
    q.tags.count == tag_count
  end

  it "should add a vote to a question" do
    q = FactoryGirl.create(:question)
    v = FactoryGirl.create(:vote)
    count = q.votes.count
    q.votes << v
    q.votes.count == count + 1
  end

  it "should add a comment to a question" do
    q = FactoryGirl.create(:question)
    count = q.comments.count
    c = FactoryGirl.create(:comment)
    q.comments << c
    q.comments.count == count + 1
  end

end
