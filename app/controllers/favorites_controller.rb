class FavoritesController < ApplicationController
  before_action :set_user!
  before_action :load_favoritable, only: [:create]

  def index
    @albums = @user.favorited_albums
    @artists = @user.favorited_artists
    @songs = @user.favorited_songs
  end

  def create
    if @favorite.save
      redirect_to favorites_index_path, notice: 'Favorite has been added'
    else
      redirect_to favorites_index_path, alert: 'Errors prevented creation of favorite.'
    end
  end

  def destroy
    @favorite = Favorite.find(favorite_params[:id])

    if @favorite.destroy
      redirect_to favorites_index_path, notice: 'Favorite has been removed'
    end
  end

  private

  def set_user!
    authenticate_user!
    @user = current_user
  end

  
  def load_favoritable #assumes nested path!!
    @request = request
    @resource, @id = @request.path.split('/')[1,2]
    @favoritable = @resource.singularize.classify.constantize.find(@id)
    @favorite = @favoritable.favorites.new(user_id: @user.id)
  end

  def favorite_params
    params.require(:favorite).permit(:id)
  end
end



