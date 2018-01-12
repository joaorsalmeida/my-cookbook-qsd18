Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :recipes, only: [:show, :new, :create, :edit, :update] do
    member do
      post 'favorite'
    end

    collection do
      get 'busca'
    end
  end
  resources :cuisines, only: [:show, :new, :create]
end
