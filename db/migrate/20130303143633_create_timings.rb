class CreateTimings < ActiveRecord::Migration
  def change
    create_table :timings do |t|
      t.datetime :initial_time
      t.datetime :final_time
      t.string :global_time
      t.integer :user_id
      t.integer :track_id

      t.timestamps
    end
  end
end
