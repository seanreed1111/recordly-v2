class AddFavoriteToArtistsAlbumsSongs < ActiveRecord::Migration
  def change
    add_column :albums, :favorite, :boolean, null: false, default: false
    add_column :artists, :favorite, :boolean, null: false, default: false
    add_column :songs, :favorite, :boolean, null: false, default: false
  end
end
