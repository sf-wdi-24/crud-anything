Rails.application.routes.draw do

  root 'welcome#home_page'

  resources :categories, except: [:destroy]
  resources :photos
  resources :users, except: [:index, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
end

