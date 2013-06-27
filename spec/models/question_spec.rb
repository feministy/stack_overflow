require 'spec_helper'

describe Question do

  it { should belong_to(:user)}
  it { should have_many(:comments) }

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
end
