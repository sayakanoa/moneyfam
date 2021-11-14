Rails.application.routes.draw do
  root to: 'homes#top'

  devise_for :users
  resources :users
  resources :events
  resources :payments
  resources :post_comments, only: [:create, :destroy]
  resources :wants
  resources :buys
end
