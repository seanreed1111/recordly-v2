require "rails_helper"

RSpec.feature describe "add favorite " do
  let(:user) {create(:user)}
  let(:artist) {create(:artist)}
  let(:album) {create(:album, user: user, artist: artist)}
  let(:song) {create(:song, album: album)}

  before do
    login_as(user)
  end



  describe "via clicking a link on the home page for" do
    before do
      visit "/"     
    end
    scenario "Album" do
      favorite = create(:favorite, user: user, favoritable_id: album.id, favoritable_type:"Album" )
      click_link "Show Favorites"
      expect(page).to have_css("#favorite-album-#{album.id}")
    end

    scenario "Song" do
      favorite = create(:favorite, user: user, favoritable_id: song.id, favoritable_type:"Song" )
      click_link "Show Favorites"

      expect(page).to have_css("#favorite-song-#{song.id}")    
    end


    scenario "Artist" do
      favorite = create(:favorite, user: user, favoritable_id: artist.id, favoritable_type:"Artist" )
      click_link "Show Favorites"
      expect(page).to have_css("#favorite-artist-#{artist.id}")      
    end


  end

  describe "programmatically for:" do
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
end
