class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :model_name, :brand_name, :year, :mileage, :price

  def model_name
    self.object&.vehicle_model&.name
  end

  def brand_name
    self.object&.vehicle_model&.vehicle_brand&.name
  end
end
