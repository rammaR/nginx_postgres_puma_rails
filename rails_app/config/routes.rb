require 'sidekiq/web'

Rails.application.routes.draw do
  
  namespace :user_devise_backoffice do
    get 'welcome/index'
  end

  namespace :admins_backoffice do
    get 'welcome/index'
  end

  #get 'customer/index'

  devise_for :members
  devise_for :admins
  devise_for :user_devises

  get 'post/index'
  get 'post/edit'
  get 'home/index'

  # Autenticação
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :reports, only: [:index, :create]
  resources :users
  resources :sessions
  resources :cookies
  resources :mining_types
  resources :coins
  resources :password_resets
  resources :customer

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  mount Sidekiq::Web => '/sidekiq'
end