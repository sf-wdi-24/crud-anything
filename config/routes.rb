Rails.application.routes.draw do

  root 'welcome#home_page'

  resources :categories
  resources :photos
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  

end
