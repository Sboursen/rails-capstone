Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :categories
  
  # Defines the root path route ("/")
  root "users#index"
end
