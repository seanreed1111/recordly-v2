class Artist < ActiveRecord::Base
  has_many :albums
  has_many :favorites, as: :favoritable #polymorphic

end
