Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :categories, only: [:index, :show, :new, :create] do 
    resources :expenses, only: [:index, :show, :new, :create]
  end
  
  # Defines the root path route ("/")
  root "users#index"
end
