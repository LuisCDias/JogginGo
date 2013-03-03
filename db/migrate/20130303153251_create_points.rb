class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.string :N
      t.string :W
      t.integer :track_id

      t.timestamps
    end
  end
end
