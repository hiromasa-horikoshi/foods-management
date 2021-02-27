Rails.application.routes.draw do
  devise_for :users
  root to: 'communities#index'
  resources :users, only: [:edit, :update]
  resources :communities, only: [:new, :create, :destroy] do
    resources :videos, only: [:index, :create]
    collection do
      get 'search', to: "videos#search"
    end
  end
end
