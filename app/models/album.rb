class Album < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user
  has_one :artist
  accepts_nested_attributes_for :artist

  has_many :songs
  accepts_nested_attributes_for :songs
  validate :all_song_names_are_unique #  it "does not allow duplication of album name for a User, given artist name"

  has_many :favorites, as: :favoritable #polymorphic

  def all_song_names_are_unique
    true
  end
end

