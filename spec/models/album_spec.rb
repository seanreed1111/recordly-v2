require 'rails_helper'

RSpec.describe Album, type: :model do
  it "is invalid without a name"
  it "can add a new valid song"
  
  describe "invalid valid songs" do
    context "cannot add two songs with same name" do
    end
  end
end
