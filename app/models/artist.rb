class Artist < ActiveRecord::Base
  has_many :albums, dependent: :nullify
  has_many :favorites, as: :favoritable, dependent: :destroy #polymorphic

  validates :name, presence: true

end
