require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) {FactoryGirl.create(:user)}

  describe " User validations" do
    it "has a valid factory" do
      expect(user).to be_valid
    end
  end
end