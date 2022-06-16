class FavoritesController < ApplicationController

  def index
    @pictures = User.find(session[:user_id]).favorite_pictures
  end
end
