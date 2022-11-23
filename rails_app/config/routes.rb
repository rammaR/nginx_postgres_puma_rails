require 'sidekiq/web'

Rails.application.routes.draw do
  get 'post/index'

  get 'post/edit'

  mount Sidekiq::Web => '/sidekiq'
  
  resources :mining_types
  resources :coins

  get 'home/index'
  
  resources :reports, only: [:index, :create]
  resources :users
  resources :cookies

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end