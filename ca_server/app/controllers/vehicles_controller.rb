class VehiclesController < ApplicationController
  include TestAuthorizeable

  before_action :test_authorize!, only: [:create]

  def index
    @vehicles = Vehicle.filter_by(vehicle_params)
    render json: @vehicles
  end

  def create
    build_vehicle

    if @vehicle.save
      render json: @vehicle, status: 200
    else
      render json: {error: 'Invalid parameters'}, status: 500
    end
  end

  private

  def build_vehicle
    @vehicle = Vehicle.new(year: vehicle_create_params[:year], 
                           listed_price: params[:price], 
                           mileage: params[:mileage], 
                           vehicle_model: VehicleModel.find_by(name: params[:model]))
  end

  def vehicle_create_params
    params.permit(:brand, :model, :year, :price, :mileage)
  end

  def vehicle_params
    params.permit(:model_name, :brand_name, :year, :mileage, :price, :rating)
  end
end
