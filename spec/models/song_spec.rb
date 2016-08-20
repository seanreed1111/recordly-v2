require 'rails_helper'

RSpec.describe Song, type: :model do
  let(:song) {create(:song)}
    describe " Validations" do
      it "has a valid factory" do
        expect(song).to be_valid
      end
    end
end
