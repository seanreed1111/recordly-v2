class SongsController < ApplicationController
  before_action :set_user!
  before_action :set_album, only: [:new, :create]
  before_action :set_song, only: [:show, :edit, :update, :destroy]


  def index
    @songs = @user.songs
  end

  def new
    @song = @album.songs.new
  end

  def create
    @song = @album.songs.new(song_params)

    if @song.save
      redirect_to @album, notice: 'Song was successfully created.'
    else
      render :new
    end
  end


  def edit
  end

  def show
    @album = @song.album
  end



  def update
    if @song.update(song_params)
      redirect_to @album, notice: 'Song was successfully updated.'
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
      @album = Album.find(params[:album_id])
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