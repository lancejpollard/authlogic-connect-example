AuthlogicConnectExample::Application.routes.draw do |map|
  match "/reset" => "users#detonate"
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match 'login' => 'user_sessions#new', :as => :login
  match 'authenticate' => 'user_sessions#create', :as => :authenticate, :via => :post
  match 'signup' => 'users#new', :as => :signup
  match 'register' => 'users#create', :as => :register, :via => :post
  match 'connect' => 'users#update', :as => :connect, :via => :put
  map.resources :users
  map.resource :user_session
  
  match ':id' => 'users#show', :as => :profile
  root :to => "users#new"
  
end