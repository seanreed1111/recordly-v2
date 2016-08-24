Rails.application.routes.draw do
  get 'favorites/index'

  resources :albums, :songs, :artists, only: [] do
    resources :favorites, only: [:create, :destroy]
  end

  resources :favorites, only: [:destroy], as: "destroy_favorite"

  resources :artists, only: [:index, :show, :edit, :update]
  resources :songs, only: [:index, :show]

  resources :albums do
    resources :artists, only: [:new, :create, :destroy] 
    resources :songs, only: [:new, :create, :edit, :update, :destroy]
  end

  get 'user/search', to: "user#ransack_search", as: "search"
  devise_for :users
  root 'albums#index'
  get '*unmatched_route', to: 'application#not_found'
end
