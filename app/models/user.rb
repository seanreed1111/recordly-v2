class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :albums, dependent: :destroy
  has_many :songs, through: :albums

  has_many :favorites, inverse_of: :user, dependent: :destroy

  has_many :favorited_albums, through: :favorites,
            source: :favoritable, source_type: 'Album'

  has_many :favorited_artists, through: :favorites,
            source: :favoritable, source_type: 'Artist'

  has_many :favorited_songs, through: :favorites,
          source: :favoritable, source_type: 'Song'

  ########### ADD YOUR FAVORITE SEARCH FUNCTION HERE!!!!! #################
  # use ransack https://anadea.info/blog/ultimate-index-pages-by-ransack
  #https://github.com/activerecord-hackery/ransack
  
  def search(text)
    [Album.new(name: "This is the Default Album Search Result"),
    Song.new(name: "This is the Default Song Search Result"), 
    Artist.new(name: "This is the Default Artist Search Result")]
  end

  def artists
    self.albums.artists if self.albums.present?
  end

  def songs
    self.albums.songs if self.albums.present?
  end

end
