class Album < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist
  
  validates :name, presence: true
  validates :name, uniqueness: {scope: :artist_id,
    message: "only one album of same name per artist"}

  accepts_nested_attributes_for :artist

  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs

  has_many :favorites, as: :favoritable, dependent: :destroy #polymorphic

  def artist?
    self.artist_id.present?
  end

  def artist_name_field?
    self.artist_name_field.present?
  end

  def assign_artist!(artist_name)
  end

  #there are three option
  # 1 Need to create a new artist object where none exists
  # 2 Need to find a currently existing artist object with the appropriate name to 
  #   associate with the album
  # 3 Need to update the currently associated artist object with a new object with 
  #    the correct name. Either find the new object or create it.
  #so, lots of creating and finding going on.
  #album needs to be able to reach down and search into objects

  #######
  #the other option is just to do away with artist objects altogether!!!!!
  #every album has an associated name, and the name cannot be duplicated
  #among albums with the same artist name.

  ## Then I would just need to write the query that finds albums by artist name
  ####
  def create_or_find_artist?
    self.artist_name_field? && self.artist.blank?
  end

  def sync_artist?
    (self.artist?) && (self.artist_name_field?) && (self.artist.name != self.artist_name_field)
  end




end

