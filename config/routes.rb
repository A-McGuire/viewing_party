Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  
  get "/dashboard", to: "users#index"

  get "/discover", to: "movies#discover"

  post "/login", to: "sessions#create"

  resources :users, only: [:create]
  
  resources :movies, only: [:index, :show]
end
