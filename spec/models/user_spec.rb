require 'spec_helper'

describe User do
  describe "#full_name" do
    it "should be first and last name" do
      create(:user, :first_name => "Kriz", :last_name => "Mendoza").full_name.should eq("Kriz Mendoza")
    end
  end
end
