AuthlogicConnectExample::Application.routes.draw do |map|
  match "/users/destroy_all", :to => "users#destroy_all"
  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_session
  root :to => "users#new"
  
end