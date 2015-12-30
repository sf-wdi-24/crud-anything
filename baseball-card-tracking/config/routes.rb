Rails.application.routes.draw do

	root to: 'users#index'

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	get '/logout' => 'sessions#destroy'

	get '/signup' => 'users#new'
	post '/users' => 'users#create'

	get '/search' => 'search_queries#index', as: "search_queries"
	post '/search' => 'search_queries#create'

	resources :users
	resources :cards
  
end
