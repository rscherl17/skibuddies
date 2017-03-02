class AddPhotoCountToMountains < ActiveRecord::Migration[5.0]
  def change
    add_column :mountains, :photos_count, :integer
  end
end
