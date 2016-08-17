class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :favoritable_id
      t.string :favoritable_type

      t.timestamps null: false
    end
  end
end
