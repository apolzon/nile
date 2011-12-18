require 'spec_helper'

describe User do
  describe "validation" do
    it "requires name" do
      user = User.create
      user.errors[:name].should be_present
    end
    it "requires email" do
      user = User.create
      user.errors[:email].should be_present
    end
  end
end
