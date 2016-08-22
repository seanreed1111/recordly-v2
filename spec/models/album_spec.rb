require 'rails_helper'

RSpec.describe Album, type: :model do

  describe "Validations" do
    #it {should validate_presence_of(:name)}

    it "should not include duplicate song names on same album on song.create" do
      album = create(:album, name: "MyFirstAlbum")
      song1 = create(:song, name: "Song1", album: album)
      song2 = build(:song, name: "Song1", album: album)
      expect(album.songs).to include song1
      expect(song2).not_to be_valid
    end

    it "should not include duplicate song names on same album on song.update" do
      album = create(:album, name: "MySecondAlbum")
      song1 = create(:song, name: "Song1", album: album)
      song2 = create(:song, name: "Song2", album: album)
      expect(song2.update(name: "Song1")).to be_falsey
      expect(album.songs).to include song1
      expect(album.songs).to include song2
    end

    it "should not allow two albums with same name for same artist on album.create" do
      artist = create(:artist, name: "Artist1")
      album1 = create(:album, name: "album1", artist_id: artist.id)
      album2 = build(:album, name: "album1", artist_id: artist.id)
      expect(album2).to_not be_valid
    end

    it "should not allow two albums with same name for same artist on album.save" do
      artist = create(:artist, name: "Artist1")
      album1 = create(:album, name: "album1", artist_id: artist.id)
      album2 = create(:album, name: "album2", artist_id: artist.id)
      album2.update(name: "album1")
      expect(album2).not_to be_valid
    end

  end
end


