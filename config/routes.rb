Rails.application.routes.draw do

  root "trips#index"

  resources :trips

end

#    Prefix Verb   URI Pattern               Controller#Action
#      root GET    /                         trips#index
#     trips GET    /trips(.:format)          trips#index
#           POST   /trips(.:format)          trips#create
#  new_trip GET    /trips/new(.:format)      trips#new
# edit_trip GET    /trips/:id/edit(.:format) trips#edit
#      trip GET    /trips/:id(.:format)      trips#show
#           PATCH  /trips/:id(.:format)      trips#update
#           PUT    /trips/:id(.:format)      trips#update
#           DELETE /trips/:id(.:format)      trips#destroy
