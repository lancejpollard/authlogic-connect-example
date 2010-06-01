AuthlogicConnectExample::Application.routes.draw do |map|
  
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match 'login' => 'user_sessions#new', :as => :login
  match 'authenticate' => 'user_sessions#create', :as => :authenticate, :via => :post
  match 'signup' => 'users#new', :as => :signup
  match 'connect' => 'users#update', :as => :connect, :via => :post

  match "reset" => "users#detonate"

  map.resources :users
  map.resource :user_session
  
  match ':id' => 'users#show', :as => :profile
  root :to => "user_sessions#new"
  
end
