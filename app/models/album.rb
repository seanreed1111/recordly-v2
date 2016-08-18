class Album < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist
  
  validates :name, presence: true
  validates :name, uniqueness: {scope: :artist_id,
    message: "only one album of same name per artist"}

  accepts_nested_attributes_for :artist

  has_many :songs
  accepts_nested_attributes_for :songs

  has_many :favorites, as: :favoritable #polymorphic


end

