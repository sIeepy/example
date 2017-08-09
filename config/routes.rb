Rails.application.routes.draw do

  devise_for :users
  root 'home#welcome'

  resources :users
  resources :microposts

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]

  devise_scope :user do
    authenticated :user do
      root to: 'home#welcome', as: :authenticated_root
    end
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
