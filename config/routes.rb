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

  get 'user/search', to: "user#search", as: "search"
  devise_for :users
  root 'albums#index'
  get '*unmatched_route', to: 'application#not_found'
end
        #  favorites_index GET    /favorites/index(.:format)                  favorites#index
        #  album_favorites POST   /albums/:album_id/favorites(.:format)       favorites#create
        #   album_favorite DELETE /albums/:album_id/favorites/:id(.:format)   favorites#destroy
        #   song_favorites POST   /songs/:song_id/favorites(.:format)         favorites#create
        #    song_favorite DELETE /songs/:song_id/favorites/:id(.:format)     favorites#destroy
        # artist_favorites POST   /artists/:artist_id/favorites(.:format)     favorites#create
        #  artist_favorite DELETE /artists/:artist_id/favorites/:id(.:format) favorites#destroy
        #         favorite DELETE /favorites/:id(.:format)                    favorites#destroy
