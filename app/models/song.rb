class Song < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :album
  has_many :favorites, as: :favoritable, dependent: :destroy #polymorphic

  validates :name, uniqueness: {scope: :album_id,
    message: "only one song of same name per album"}

  def artist
    Artist.where(id: self.album.artist_id) if self.album
  end
end
