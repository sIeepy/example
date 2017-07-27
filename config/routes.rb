Rails.application.routes.draw do

  devise_for :users
  root 'home#welcome'

  resources :users do
    resources :microposts
  end
  resources :users
  resources :microposts
end
