require 'rails_helper'

RSpec.describe Album, type: :model do

  describe "Validations" do
    it {should validate_presence_of(:name)}
      it "should not include duplicate song names on same album" do
      album = Album.create(name: "MyFirstAlbum")
      song1 = Song.create(name: "Song1", album_id:album.id)
      song2 = Song.create(name: "Song1", album_id:album.id)
      expect(album.songs).to include song1
      expect(album.songs).not_to include song2
    end
  end
end


