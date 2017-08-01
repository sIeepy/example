Rails.application.routes.draw do

  devise_for :users
  root 'home#welcome'

  resources :users
  resources :microposts

  devise_scope :user do
    authenticated :user do
      root to: 'home#welcome', as: :authenticated_root
    end

    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
