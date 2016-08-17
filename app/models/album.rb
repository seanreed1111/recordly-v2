class Album < ActiveRecord::Base
  belongs_to :user
  has_one :artist
  validates :name, presence: true
end

#  it "does not allow duplication of album name for a User, given artist name"