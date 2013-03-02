class AddPrivateApprovedToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :private, :boolean, :default => true
    add_column :tracks, :approved, :boolean, :default => true
  end
end
