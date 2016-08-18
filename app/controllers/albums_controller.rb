class AlbumsController < ApplicationController
  before_action :set_user!
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = @user.albums
  end

  def show
    @songs = @album.songs
  end


  def edit
    @songs = @album.songs
  end
  
  def new
    @album = @user.albums.new
  end




  def create
    @album = @user.albums.new(album_params)

    if @album.save
      redirect_to @album, notice: 'Album was successfully created.'
    else
      render :new
    end
  end


  def update
    if @album.update(album_params)
      redirect_to @album, notice: 'Album was successfully updated.'
    else
      render :edit
    end
  end

  #what do I want to happen to the songs and favorites when I 
  # destroy an album?

  def destroy
    @album.destroy
    redirect_to albums_url, notice: 'Album was successfully destroyed.'
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
      params.require(:album).permit(:name)
    end
end

# routes
#  albums     GET    /albums(.:format)                          albums#index
#             POST   /albums(.:format)                          albums#create
#  new_album  GET    /albums/new(.:format)                      albums#new
#  edit_album GET    /albums/:id/edit(.:format)                 albums#edit
#  album      GET    /albums/:id(.:format)                      albums#show
#             PATCH  /albums/:id(.:format)                      albums#update
#             PUT    /albums/:id(.:format)                      albums#update
#             DELETE /albums/:id(.:format)                      albums#destroy
#  root       GET    /                                          albums#index

