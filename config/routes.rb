Rails.application.routes.draw do
  devise_for :users
  root to: 'communities#index'
  resources :users, only: [:edit, :update]
  resources :communities, only: [:new, :create, :destroy]
end
