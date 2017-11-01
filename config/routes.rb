Rails.application.routes.draw do
  root 'search#index'

  resources :search, only: [:index, :show]

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end
