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
  def search(text)
    [Album.new(name: "Default Album Search Result"),
    Song.new(name: "Default Song Search Result"), 
    Artist.new(name: "Default Artist Search Result")]
  end

end
