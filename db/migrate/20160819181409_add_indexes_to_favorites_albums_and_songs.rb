class AddIndexesToFavoritesAlbumsAndSongs < ActiveRecord::Migration
  def change
    add_index :favorites, [:favoritable_id, :favoritable_type], unique: true
    add_index :songs, [:name, :album_id], unique: true
    add_index :albums, [:name, :artist_id], unique: true  
  end
end
