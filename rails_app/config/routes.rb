require 'sidekiq/web'

Rails.application.routes.draw do
  
  namespace :user_backoffice do
    get 'welcome/index'
  end

  namespace :admin_backoffice do
    get 'welcome/index'
  end

  namespace :user_backoffice do
    get 'welcome/index'
  end

  #get 'customer/index'

  devise_for :members
  devise_for :admins
  devise_for :users

  get 'post/index'
  get 'post/edit'
  get 'home/index'

  resources :reports, only: [:index, :create]
  # resources :users
  # resources :sessions
  resources :cookies
  resources :mining_types
  resources :coins
  resources :password_resets
  resources :customer

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  mount Sidekiq::Web => '/sidekiq'
end