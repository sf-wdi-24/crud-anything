Rails.application.routes.draw do

  root "trips#index"

  resources :trips do
    resources :posts
  end

end


