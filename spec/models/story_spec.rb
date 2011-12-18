require 'spec_helper'

describe Story do
  describe "validations" do
    it "requires a title" do
      story = Story.create
      story.errors[:title].should be_present
    end
    it "requires a description" do
      story = Story.create
      story.errors[:description].should be_present
    end
    it "requires an owner" do
      story = Story.create
      story.errors[:owner].should be_present
    end
  end
end