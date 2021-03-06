Rails.application.routes.draw do
  root to: 'homes#top'
  get 'about' => 'homes#about'

  devise_for :users
  resources :users
  resources :events
  resources :payments
  resources :post_comments, only: [:new, :create, :destroy]
  resources :wants
  resources :buys
  resources :notifications, only: :index
end
