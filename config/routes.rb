Rails.application.routes.draw do
  root 'splash#index'
  get 'splash/index'

  resources :categories do
    resources :payments
  end

  resources :payments
  devise_for :users

  unauthenticated do
    root 'splash#index', as: :unauthenticated_root
  end

  resources :users do
    resources :categories, only: [:show, :new, :create, :destroy]
  end
end







