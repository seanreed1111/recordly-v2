class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :albums, dependent: :destroy
  has_many :songs, through: :albums
  has_many :artists, through: :albums

  has_many :favorites, inverse_of: :user, dependent: :destroy

  has_many :favorited_albums, through: :favorites,
            source: :favoritable, source_type: 'Album'

  has_many :favorited_artists, through: :favorites,
            source: :favoritable, source_type: 'Artist'

  has_many :favorited_songs, through: :favorites,
          source: :favoritable, source_type: 'Song'

  
  # Now using Ransack search gem directly from the users_controller

  # def search(query)
  #   [Album.new(name: "This is the Default Album Search Result"),
  #   Song.new(name: "This is the Default Song Search Result"), 
  #   Artist.new(name: "This is the Default Artist Search Result")]
  # end

  # #() -> [Artist] or nil
  # def artists
  #   self.albums.present? ? self.albums.artists : nil 
  # end

  # #() -> [Song] or nil
  # def songs
  #   self.albums.present? ? self.albums.songs : nil
  # end

  # convert this to return a hash instead of an array
  # use keys = [:albums, :artists, :songs]
  # and values = [self.favorited_albums, self.favorited_artists, self.favorited_songs]

  #() -> [ [Album], [Song], [Artist] ]
  def favorites
    [self.favorited_albums + self.favorited_artists + self.favorited_songs] 
  end



# Object -> Bool
  def favorite?(object)
    self.find_in_favorites(object).present?
  end


  # this method returns same object passed to it or nil if object is NOT in favorites

  # Object -> Object or nil
  def find_in_favorites(object)
    object_or_nil = case object.class.to_s
      when "Album" then self.favorited_albums.select{|record| record.id == object.id}
      when "Artist" then self.favorited_artists.select{|record| record.id == object.id}
      when "Song" then self.favorited_songs.select{|record| record.id == object.id}
      else nil
    end
    object_or_nil 
  end

##########################################################
############## Decide which of these will be most useful
##########################################################

  # String -> Favorite
  def favorite!(artist_name)
  end

  # Artist -> ()
  def favorite!(artist_object)
  end

  # String -> Bool
  def artist_exists?(artist_name)
  end

  # String -> Artist
  def create_artist!(artist_name)
  end

  # String -> Artist
  def find_or_create_artist!(artist_name)
  end
end
