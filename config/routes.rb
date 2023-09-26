Rails.application.routes.draw do
  devise_for :users
  root to: 'protospaces#index'
  resources :protospaces
  resources :users, only: :show
end
