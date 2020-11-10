class CreateGps < ActiveRecord::Migration[6.0]
  def change
    create_table :gps do |t|
      t.datetime :sent_at
      t.float :longitude
      t.float :latitude
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
