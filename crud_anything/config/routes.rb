Rails.application.routes.draw do
  resources :your_scaffolds
  resources :post_attachments
  root "posts#index"

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/login' => 'sessions#destroy'


resources :posts

end
