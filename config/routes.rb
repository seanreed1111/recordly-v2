Rails.application.routes.draw do
  devise_for :users

  resources :artists

  resources :albums do
    resources :songs
  end

  get 'user/search', to: "user#search", as: "search"
  root 'albums#index'

  get '*unmatched_route', to: 'application#not_found'
end
