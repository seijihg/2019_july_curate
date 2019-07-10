Rails.application.routes.draw do
  get "/", to: "exhibitions#index", as: "index"

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy", as: "logout"
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :exhibitions
  resources :users, only: [:new, :create, :show, :edit, :update]
  # resources :comment_likes
  # resources :comments
  # resources :likes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
