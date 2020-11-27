Rails.application.routes.draw do

  get 'orders/index'
  devise_for :users
  root "items#index"
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :orders, only: [:index, :create]
end
