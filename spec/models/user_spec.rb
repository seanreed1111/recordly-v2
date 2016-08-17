require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) {FactoryGirl.create(:user)}

  describe " User validations" do
    it "has a valid factory" do
      expect(user).to be_valid
    end
  end


  it "has albums"
  it "has songs, through albums"
  it "has artists, through albums"
  it "does not allow duplication of album name for a given artist name"
end