Rails.application.routes.draw do

	root to: 'users#index'

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	get '/logout' => 'sessions#destroy'

	get '/signup' => 'users#new'
	post '/users' => 'users#create'

	get '/search' => 'search_queries#index', as: "search_queries"
	post '/search' => 'search_queries#create'

	get '/settings' => 'users#edit', as: "edit_user"
	put '/settings' => 'users#update'
	delete '/settings' => 'users#destroy', :as => "destroy_user"

	get '/users/:id/cards' => 'users#show_user_cards', as: "user_cards"
	delete '/users/:id/cards' => 'cards#destroy', as: "delete_single_card"

	get '/users/:id/searches' => 'users#show_user_search_queries', as: "user_searches"
	delete '/users/:id/searches' => 'search_queries#destroy', as: "delete_search_query"
	get '/users/:id/searches/:id' => 'users#show_user_search_query', as: "user_search"

	resources :users
	resources :cards
  
end
