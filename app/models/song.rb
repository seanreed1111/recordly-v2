class Song < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :album
  has_many :favorites, as: :favoritable #polymorphic

  validates :name, uniqueness: {scope: :album_id,
    message: "only one song of same name per album"}
end
