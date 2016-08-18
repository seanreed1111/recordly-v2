require 'rails_helper'

RSpec.describe Album, type: :model do

  describe "Validations" do
    it {should validate_presence_of(:name)}

    it "should not include duplicate song names on same album on song.create" do
      album = Album.create(name: "MyFirstAlbum")
      song1 = Song.create(name: "Song1", album_id:album.id)
      song2 = Song.create(name: "Song1", album_id:album.id)
      expect(album.songs).to include song1
      expect(album.songs).not_to include song2
    end

    it "should not include duplicate song names on same album on song.update" do
      album = Album.create(name: "MySecondAlbum")
      song1 = Song.create(name: "Song1", album_id:album.id)
      song2 = Song.create(name: "Song2", album_id:album.id)
      song2.update(name: "Song1")
      expect(album.songs).to include song1
      expect(album.songs).to include song2
      expect(song2).not_to be_valid
    end

    it "should not allow two albums with same name for same artist on album.create" do
      artist = Artist.create(name: "Artist1")
      album1 = Album.create(name: "album1", artist_id: artist.id)
      album2 = Album.create(name: "album1", artist_id: artist.id)
      expect(album2).not_to be_valid
    end

    it "should not allow two albums with same name for same artist on album.save" do
      artist = Artist.create(name: "Artist1")
      album1 = Album.create(name: "album1", artist_id: artist.id)
      album2 = Album.create(name: "album2", artist_id: artist.id)
      album2.update(name: "album1")
      expect(album2).not_to be_valid
    end

  end
end


