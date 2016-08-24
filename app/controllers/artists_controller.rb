class ArtistsController < ApplicationController
  before_action :set_user!
  before_action :set_album, only: [:show, :new, :create, :destroy]
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  # GET /artists
  def index
    @artists = @user.artists
  end

  # GET /artists/1
  def show
    @albums = @artist.albums
  end

  # GET /artists/1/edit
  def edit
    @albums = @artist.albums
  end

  # GET /artists/new
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





  # PATCH/PUT /artists/1
  def update
    if @artist.update(artist_params)
      redirect_to @artist, notice: 'Artist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /artists/1
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
