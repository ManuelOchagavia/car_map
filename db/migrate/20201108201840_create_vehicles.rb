class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles  do |t|
      t.string :vehicle_identifier, unique: true
      t.datetime :sent_at
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
