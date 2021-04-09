class VehicleModelsController < ApplicationController
    include TestAuthorizeable

    before_action :test_authorize!, only: [:create]

    def create
        if @vehicle_model.save
            render json: @vehicle_model, status: 200
        else
            render json: {error: 'Invalid parameters'}, status: 500
        end
    end

    private

    def build_vehicle_model
        @vehicle_model = VehicleModel.new(vehicle_model_params.except(:brand))
        @vehicle_model.vehicle_brand = VehicleBrand.find_or_create_by(name: vehicle_model_params[:brand])
    end

    def vehicle_model_params
        params.permit(:name, :brand, :market_price)
    end
end
