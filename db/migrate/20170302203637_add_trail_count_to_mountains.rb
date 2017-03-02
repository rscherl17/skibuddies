class AddTrailCountToMountains < ActiveRecord::Migration[5.0]
  def change
    add_column :mountains, :trails_count, :integer
  end
end
