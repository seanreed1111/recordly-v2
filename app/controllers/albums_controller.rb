class AlbumsController < ApplicationController
  before_action :set_user!
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  #after_action :create_artist? only: [:create, :update]

  def index
    @albums = @user.albums
  end

  def show
    @songs = @album.songs
  end


  def new
    @album = @user.albums.new
  end

  def create
    @album = @user.albums.new(album_params)

    if @album.save
      redirect_to albums_path, notice: 'Album was successfully created.'
    else
      render :new
    end
  end


  def edit
    @songs = @album.songs
  end
  
  def update
    if @album.update(album_params)
      redirect_to albums_path, notice: 'Album was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html {redirect_to albums_url, notice: 'Album was successfully destroyed.'}
      format.js
    end
  end

  private

  def set_user!
    authenticate_user!
    @user = current_user
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_album
    @album = Album.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def album_params
    params.require(:album).permit(:name, :artist_name_field)
  end
end

