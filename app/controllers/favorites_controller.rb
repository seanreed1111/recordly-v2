class FavoritesController < ApplicationController
  before_action :set_user!
  before_action :load_favoritable, except: [:index]

  def index
    @albums = @user.favorited_albums
    @artists = @user.favorited_artists
    @songs = @user.favorited_songs    
  end


  def create
    @favorite = @favoritable.favorites.new(user_id: @user.id)
    if @favorite.save
      redirect_to :back, notice: 'Favorite has been created' ########### CHANGE THIS REDIRECT
    else
  #    redirect_to :back, notice: 'Errors prevented creation of favorite.'
    end
  end

  def destroy
    @favorite = @favoritable.favorites.where(user_id: @user.id).first

    if @favorite.destroy
  #    redirect_to controller: :favorites, action: :index, alert:'Favorite has been removed'
      redirect_to :back, notice: 'Favorite has been created' ######CHANGE THIS REDIRECT
    end
  end
  private

  def set_user!
    authenticate_user!
    @user = current_user
  end
  
  def load_favoritable
    @request = request
    @resource, @id = @request.path.split('/')[1,2]
    @favoritable = @resource.singularize.classify.constantize.find(@id)
  end
end
