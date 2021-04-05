class VehicleModelsController < ApplicationController
    def create
        vehicle_brand = VehicleBrand.find_or_create_by(name: vehicle_model_params[:brand])
        vehicle_model = VehicleModel.new(name: vehicle_model_params[:name], vehicle_brand: vehicle_brand)

        if vehicle_model.save
            render json: vehicle_model, status: 200
        else
            render json: {error: 'Invalid parameters'}, status: 500
        end
    end

    private

    def vehicle_model_params
        params.permit(:name, :brand)
    end
end
