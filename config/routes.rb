Rails.application.routes.draw do

  root "trips#index"

  resources :trips do
    resources :posts
    resources :images, shallow: true
  end
  get "images", to: "images#index", as: :images
end


