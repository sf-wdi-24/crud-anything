Rails.application.routes.draw do

  root 'parents#index'

  resources :parents
  resources :children

end

# Prefix Verb   URI Pattern                  Controller#Action
#        root GET    /                            parents#index
#     parents GET    /parents(.:format)           parents#index
#             POST   /parents(.:format)           parents#create
#  new_parent GET    /parents/new(.:format)       parents#new
# edit_parent GET    /parents/:id/edit(.:format)  parents#edit
#      parent GET    /parents/:id(.:format)       parents#show
#             PATCH  /parents/:id(.:format)       parents#update
#             PUT    /parents/:id(.:format)       parents#update
#             DELETE /parents/:id(.:format)       parents#destroy
#    children GET    /children(.:format)          children#index
#             POST   /children(.:format)          children#create
#   new_child GET    /children/new(.:format)      children#new
#  edit_child GET    /children/:id/edit(.:format) children#edit
#       child GET    /children/:id(.:format)      children#show
#             PATCH  /children/:id(.:format)      children#update
#             PUT    /children/:id(.:format)      children#update
#             DELETE /children/:id(.:format)      children#destroy