require "rails_helper"

RSpec.feature describe "Users can remove a favorite: " do
  let!(:user) {create(:user)}
  let!(:artist) {create(:artist)}
  let!(:song) {create(:song)}
  let!(:album){create(:album)}
  let!(:album_favorite) {create(:favorite, 
                        user:user, favoritable_id:album.id, 
                        favoritable_type: album.class.name)}
  let!(:artist_favorite) {create(:favorite, 
                        user:user, favoritable_id:artist.id, 
                        favoritable_type: artist.class.name)}
  let!(:song_favorite) {create(:favorite, 
                        user:user, favoritable_id:song.id, 
                        favoritable_type: song.class.name)}  


  before do
    pending "need to show link on page before I click it"
    login_as(user)
  end

# so the visit is silently failing here
  scenario "Album" do
    visit destroy_favorite_path(album_favorite)
    favorites = user.favorites
    expect(favorites[0].map{|album|album.id}).not_to include album_favorite.favoritable_id
    expect(favorites[1].map{|artist|artist.id}).to include artist_favorite.favoritable_id
    expect(favorites[2].map{|song|song.id}).to include song_favorite.favoritable_id 
  end

  scenario "Artist" do
    visit destroy_favorite_path(artist_favorite)
    favorites = user.favorites
    expect(favorites[0].map{|album|album.id}).to include album_favorite.favoritable_id
    expect(favorites[1].map{|artist|artist.id}).not_to include artist_favorite.favoritable_id
    expect(favorites[2].map{|song|song.id}).to include song_favorite.favoritable_id 
  end

  scenario "Song" do
    visit destroy_favorite_path(song_favorite)
    favorites = user.favorites
    expect(favorites[0].map{|album|album.id}).to include album_favorite.favoritable_id
    expect(favorites[1].map{|artist|artist.id}).to include artist_favorite.favoritable_id
    expect(favorites[2].map{|song|song.id}).not_to include song_favorite.favoritable_id 
  end



end