AuthlogicConnectExample::Application.routes.draw do |map|
  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_session
  root :to => "users#new"
end