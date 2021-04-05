Rails.application.routes.draw do
  resources :vehicles, only: [:index]
  resources :vehicle_models, only: [:create]
end
