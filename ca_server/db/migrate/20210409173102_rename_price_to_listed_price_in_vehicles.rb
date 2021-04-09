class RenamePriceToListedPriceInVehicles < ActiveRecord::Migration[6.1]
  def change
    rename_column :vehicles, :price, :listed_price
  end
end
