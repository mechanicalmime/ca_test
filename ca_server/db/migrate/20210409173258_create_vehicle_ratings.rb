class CreateVehicleRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicle_ratings do |t|
      t.references :vehicle, null: true, foreign_key: true
      t.decimal :price
      t.integer :rating

      t.timestamps
    end
  end
end
