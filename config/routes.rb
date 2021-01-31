Rails.application.routes.draw do
  devise_for :users
  resources :user_stocks, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  resources :users, only: [:show]
  
  root "pages#home"
  get "search_stock", to: "stocks#search"
  get "search_user", to: "users#search"

  get "my_portfolio", to: "users#my_portfolio"
  get "following", to: "users#following"
end
