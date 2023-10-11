Rails.application.routes.draw do
  devise_for :users
  root to: "home#index" 

  # Defines the root path route ("/")
  # root "articles#index"
end
