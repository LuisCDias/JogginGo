class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :city
      t.string :country
      t.integer :user_id

      t.timestamps
    end
  end
end
