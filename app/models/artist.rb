class Artist < ActiveRecord::Base
  belongs_to :album
  validates :name, uniqueness: true
end
