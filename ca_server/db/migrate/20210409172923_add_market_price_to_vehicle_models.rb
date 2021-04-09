class AddMarketPriceToVehicleModels < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicle_models, :market_price, :integer
  end
end
