Rails.application.routes.draw do

  

  get 'identities/new'

  root to:'home#index'
  get 'home#profile' => 'home#index'
  get 'auth/:provider/callback', to: 'session#create'
  delete 'sign_out', to: 'session#destroy', as: 'sign_out'
  resources :message
end
