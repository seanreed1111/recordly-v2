class UserController < ApplicationController
  before_action :set_user!

  def search
    scrubbed_search_text = params[:search]
    results = @user.search(scrubbed_search_text)
    @albums  = results[0]
    @songs   = results[1]
    @artists = results[2]
  end

  private

  def set_user!
    authenticate_user!
    @user = current_user
  end

  def search_params
    params[:search]
  end
end
