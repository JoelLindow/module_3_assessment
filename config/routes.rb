Rails.application.routes.draw do
  root 'items#index'

  resources :search, only: [:index]
  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
  resources :stores, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index]
    end
  end
end
