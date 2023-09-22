Rails.application.routes.draw do
  devise_for :users
  root to: 'protospaces#index'
  resources :protospaces, only: [:index, :new, :create, :destroy,:show]
  resources :users, only: [:edit, :update]
end
