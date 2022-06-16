class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(id:session[:user_id])
  end
end
