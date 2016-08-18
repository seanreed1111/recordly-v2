class SongsController < ApplicationController
  before_action :set_user!
  before_action :set_album, only: [:new, :create]
  before_action :set_song, only: [:show, :edit, :update, :destroy]


  def index
    @songs = @user.songs
  end


  def show
    @album = @song.album
  end


  def new
    @song = @album.songs.new
  end


  def edit
  end


  def create
    @song = @album.songs.new(song_params)

    if @song.save
      redirect_to @song, notice: 'Song was successfully created.'
    else
      render :new
    end
  end


  def update
    if @song.update(song_params)
      redirect_to @song, notice: 'Song was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @song.destroy
    redirect_to songs_url, notice: 'Song was successfully destroyed.'
  end

  private

    def set_user!
      authenticate_user!
      @user = current_user
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(song_params[:album_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(song_params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def song_params
      params.require(:song).permit(:name, :album_id)
    end
end

#Song Routes
#  songs          GET    /songs(.:format)                           songs#index
#  song           GET    /songs/:id(.:format)                       songs#show
#  album_songs    POST   /albums/:album_id/songs(.:format)          songs#create
#  new_album_song GET    /albums/:album_id/songs/new(.:format)      songs#new
# edit_album_song GET    /albums/:album_id/songs/:id/edit(.:format) songs#edit
# album_song      PATCH  /albums/:album_id/songs/:id(.:format)      songs#update
#                 PUT    /albums/:album_id/songs/:id(.:format)      songs#update
#                 DELETE /albums/:album_id/songs/:id(.:format)      songs#destroy