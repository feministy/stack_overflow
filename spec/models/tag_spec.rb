require 'spec_helper'

describe Tag do

  it { should have_many(:questions) }
  it { should validate_presence_of(:name) }

  before(:each) do
    @count = Tag.all.count
  end

  it "should add a tag to the database when successfully created" do
    FactoryGirl.create(:tag)
    expect(Tag.all.count).to eq(@count+1)
  end

  it "should not create a tag when there is no name" do
    Tag.create(name: "")
    Tag.all.count.should eq(@count)
  end
end
