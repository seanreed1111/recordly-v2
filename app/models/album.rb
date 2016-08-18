class Album < ActiveRecord::Base

  validates :name, presence: true

  belongs_to :user
  has_one :artist
  accepts_nested_attributes_for :artist

  has_many :songs
  accepts_nested_attributes_for :songs



  has_many :favorites, as: :favoritable #polymorphic


end

