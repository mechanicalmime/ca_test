class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.filter_by(vehicle_params)
    render json: @vehicles
  end

  private

  def vehicle_params
    params.permit(:model_name, :brand_name, :year, :mileage, :price)
  end
end
