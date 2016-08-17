class Song < ActiveRecord::Base
  belongs_to :album
  has_many :favorites, as: :favoritable #polymorphic
end
