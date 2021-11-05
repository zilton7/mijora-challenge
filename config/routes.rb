Rails.application.routes.draw do
  root to: 'parcel_machines#index'
  resources :parcel_machines , only: [:index, :show]
end
