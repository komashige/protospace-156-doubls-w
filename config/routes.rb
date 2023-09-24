Rails.application.routes.draw do
  devise_for :users
  root to: 'protospaces#index'
  resources :protospaces, only: [:index, :new, :create, :destroy, :show, :edit, :update]
  resources :users, only: [:edit, :update, :new, :create]
end
