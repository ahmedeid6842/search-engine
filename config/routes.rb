Rails.application.routes.draw do
  devise_for :users
  root to: "home#index" 

  post '/search', to: 'search#search'
  get '/analytics', to: 'analytics#index'
  
  # Defines the root path route ("/")
  # root "articles#index"
end
