Rails.application.routes.draw do
  authenticated do
    root 'categories#index', as: :authenticated_root
  end
  
  unauthenticated do
    root 'splash#index'
  end

  get 'splash/index'

  resources :categories do
    resources :payments
  end

  resources :payments
  devise_for :users

  resources :users do
    resources :categories, only: [:show, :new, :create, :destroy]
  end
end
