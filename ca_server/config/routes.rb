Rails.application.routes.draw do
  resources :vehicles, only: [:index, :create]
  resources :vehicle_models, only: [:create]
end
