require 'spec_helper'

describe Answer do

  it { should belong_to(:user) }
  it { should belong_to(:question) }
  it { should have_many(:comments) }
  it { should have_many(:votes) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:question_id) }

  before(:each) do
    @count = Answer.all.count
  end

  it "should add an answer to the database when successfully created" do
    FactoryGirl.create(:answer)
    expect(Answer.all.count).to eq(@count+1)
  end

  it "should not create an answer when content is empty" do
    Answer.create(user_id: 1, question_id: 1)
    Answer.all.count.should eq(@count)
  end
end
