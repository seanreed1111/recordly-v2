class Favorite < ActiveRecord::Base
  belongs_to :user, inverse_of: :favorites
  belongs_to :favoritable, polymorphic: true

  validates :favoritable_id, :favoritable_type, presence: true

  validates :user_id, uniqueness: {
    scope: [:favoritable_id, :favoritable_type],
    message: 'can only favorite an item once'
  }

  # Given an object (Album, Artist, Song) return the favoritable_id if the object is a favorite of the user
  def self.favorite_id(user, object)
    Favorite.where(user_id: user.id, favoritable_id: object.id, favoritable_type:object.class.to_s)
  end
end
