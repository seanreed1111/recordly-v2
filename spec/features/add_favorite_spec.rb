require "rails_helper"

RSpec.feature describe "Users can add a favorite: " do
  let(:user) {create(:user)}
  let(:artist) {create(:artist)}
  let(:album) {create(:album, user: user, artist: artist)}
  let(:song) {create(:song, album: album)}

  before do
    login_as(user)
  end

  scenario "Album" do
    favorite = create(:favorite, user: user, favoritable_type:album.class.name, favoritable_id: album.id) 
    expect(favorite).to be_valid
  end

  scenario "Song" do
    favorite = create(:favorite, user: user, favoritable_type:song.class.name, favoritable_id: song.id) 
    expect(favorite).to be_valid
  end

  scenario "Artist" do
    favorite = create(:favorite, user: user, favoritable_type:artist.class.name, favoritable_id: artist.id) 
    expect(favorite).to be_valid
  end

end
