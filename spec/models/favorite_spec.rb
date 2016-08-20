require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let (:user) {create(:user)}
  let (:favorite) {create(:favorite, user: user)}

  describe " Validations" do
    it "has a valid factory" do
      expect(favorite).to be_valid
    end
    it {should validate_presence_of(:favoritable_id)}
    it {should validate_presence_of(:favoritable_type)}
  end
end