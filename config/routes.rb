Rails.application.routes.draw do
  get 'user/search'

  devise_for :users

  resources :artists, only: [:index, :show, :edit, :update]
  resources :songs, only: [:index, :show]

  resources :albums do
    resources :artists, only: [:new, :create, :destroy] 
    resources :songs, only: [:new, :create, :edit, :update, :destroy]
  end

  get 'user/search', to: "user#search", as: "search"
  root 'albums#index'

  get '*unmatched_route', to: 'application#not_found'
end
