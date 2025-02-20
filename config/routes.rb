Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  
  #custom
  get "/dashboard", to: "users#index"

  post "/login", to: "sessions#create"

  get "/logout", to: "sessions#destroy"

  #restful
  resources :users, only: [:create]
  
  resources :movies, only: [:index, :show]

  resources :discover, only: [:index]

  resources :friendships,  only: [:create, :destroy]

  resources :parties, only: [:new, :create]
end
