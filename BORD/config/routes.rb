Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, skip: [:sessions, :registrations]
  devise_for :artists, skip: :sessions
  devise_for :hosts, skip: :sessions
  
  root to: 'pages#index'

  namespace :admin do
    root to: 'pages#index'
    resources :users
    resources :profile
  end

  namespace :artist do
    root to: 'pages#index'
    resources :users
  end

  namespace :host do
    root to: 'pages#index'
    resources :users
  end
end