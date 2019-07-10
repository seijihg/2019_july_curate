Rails.application.routes.draw do
  get "/", to: "exhibitions#index", as: "index"

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy", as: "logout"
  post "like", to: "likes#create_index"

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :comment_likes
  resources :likes, only: [:create]

  resources :exhibitions do
    resources :comments, except: [:index, :new, :show], shallow: true
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
