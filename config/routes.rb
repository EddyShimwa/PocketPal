Rails.application.routes.draw do
  get 'splash/index'
  resources :payments
  resources :categories, only: [:index, :show, :new, :create] do
    get 'payments', to: 'payments#index', as: 'payments'
  end
  devise_for :users
  root 'splash#index'

  devise_scope :user do
    authenticated :user do
      root 'categories#index', as: :authenticated_root
    end
    
    unauthenticated do
      root 'splash#index', as: :unauthenticated_root
    end
  end

  resources :users do
    resources :categories, only: [:show, :new, :create, :destroy]
  end

end
