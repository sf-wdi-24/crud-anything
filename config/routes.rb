Rails.application.routes.draw do

  root "parents#index"
  get "/signup", to: "parents#new", as: "signup"
  get "/login", to: "sessions#new", as: "login"
  get "/logout", to: "sessions#destroy", as: "logout"

  resources :parents
  # might not need all children resources
  resources :children
  resources :sessions, only: [:create]
  resources :memories

end
