class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :model_name, :brand_name, :year, 
             :mileage, :final_market_price, :listed_price, :rating
end
