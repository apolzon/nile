require 'spec_helper'

describe Comment do
  describe "validations" do
    it "requires an author" do
      comment = Comment.create
      comment.errors[:author].should be_present
    end
    it "requires a body" do
      comment = Comment.create
      comment.errors[:body].should be_present
    end
  end
end
