Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  devise_for :users
  root "pages#home"
  get "search_stock", to: "stocks#search"
  get "my_portfolio", to: "users#my_portfolio"
  get "following", to: "users#following"
end
