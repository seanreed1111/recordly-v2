class ArtistsController < ApplicationController
  before_action :set_user!
  before_action :set_album, only: [:show, :new, :create, :destroy]
  before_action :set_artist, only: [:show, :edit, :update, :destroy]


  def index
    @artists = @user.artists
  end


  def show
    @albums = @artist.albums
  end




  def new
    @artist = Artist.new
  end

  # POST /artists
  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      @album.update(artist_id: @artist.id)
      redirect_to @artist, notice: 'Artist was successfully created.'
    else
      render :new, alert: "Artist was not created"
    end
  end



  def edit
    @albums = @artist.albums
  end


  def update
    if @artist.update(artist_params)
      redirect_to @artist, notice: 'Artist was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    if (@artist.destroy)
      redirect_to artists_url, notice: 'Artist was successfully destroyed.'
    else

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(artist_params[:id])
    end

    def set_album
      @album = Album.find(artist_params[:album_id])
    end

    def set_user!
      authenticate_user!
      @user = current_user
    end

    # Only allow a trusted parameter "white list" through.
    def artist_params
      params.require(:artist).permit(:name, :album_id)
    end
end
