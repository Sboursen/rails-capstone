Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  
  # Defines the root path route ("/")
  root "users#index"
end
