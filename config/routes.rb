Rails.application.routes.draw do
  get "/", to: "exhibitions#index", as: :index
  get "/signup", to: "users#new", as: :signup
  # resources :comment_likes
  # resources :comments
  # resources :likes
  resources :exhibitions, only: [:index]
  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
