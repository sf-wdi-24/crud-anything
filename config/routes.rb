Rails.application.routes.draw do

  root "trips#index"

  resources :trips, only: [:index, :new, :create, :show, :edit, :update]

end
