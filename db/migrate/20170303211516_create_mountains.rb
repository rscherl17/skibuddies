class CreateMountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
      t.string :mountain_name
      t.string :location
      t.string :vertical_feet
      t.string :skiable_acres
      t.string :number_of_trails

      t.timestamps

    end
  end
end
