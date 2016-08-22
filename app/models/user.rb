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

# using ransack, each user is only authorized
# to user results from their owner user id
#need to add the associations 

  ########### ADD YOUR FAVORITE SEARCH FUNCTION HERE!!!!! #################
  # use ransack https://anadea.info/blog/ultimate-index-pages-by-ransack
  #https://github.com/activerecord-hackery/ransack
  
  # (String) -> [ [Album], [Song], [Artist] ]

  def search(query)
    [Album.new(name: "This is the Default Album Search Result"),
    Song.new(name: "This is the Default Song Search Result"), 
    Artist.new(name: "This is the Default Artist Search Result")]
  end

  #() -> [Artist] or nil
  def artists
    self.albums.artists if self.albums.present?
  end

  #() -> [Song] or nil
  def songs
    self.albums.songs if self.albums.present?
  end

  # convert this to return a hash instead of an array
  # use keys = [:albums, :artists, :songs]
  # and values = [self.favorited_albums, self.favorited_artists, self.favorited_songs]

  #() -> [ [Album], [Song], [Artist] ]
  def favorites
    result =[self.favorited_albums, self.favorited_artists, self.favorited_songs] 
  end


end
