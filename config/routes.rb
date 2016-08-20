Rails.application.routes.draw do
  get 'favorites/index'

  get 'favorites/new'

  get 'favorites/create'

  get 'favorites/destroy'

  get 'user/search', to: "user#search", as: "search"
  devise_for :users

  resources :artists, only: [:index, :show, :edit, :update]
  resources :songs, only: [:index, :show]

  resources :albums do
    resources :artists, only: [:new, :create, :destroy] 
    resources :songs, only: [:new, :create, :edit, :update, :destroy]
  end

  root 'albums#index'

  get '*unmatched_route', to: 'application#not_found'
end
