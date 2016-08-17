require 'rails_helper'

RSpec.describe Album, type: :model do

  describe "Validations" do
    it {should validate_presence_of(:name)}
    it "cannot add two songs with same name" do
    end
  end
end

#  it "does not allow duplication of album name for a User
#, given artist name"