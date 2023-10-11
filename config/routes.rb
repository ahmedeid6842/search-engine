Rails.application.routes.draw do
  devise_for :users
  root to: "home#index" 

  post '/search', to: 'home#search'

  # Defines the root path route ("/")
  # root "articles#index"
end
