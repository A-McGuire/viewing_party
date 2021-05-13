Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  
  post "/users", to: "users#create"
  get "/dashboard", to: "users#index"
  post "/login", to: "sessions#create"
end
