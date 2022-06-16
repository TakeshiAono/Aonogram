class ApplicationController < ActionController::Base
  before_action :user_icon

  def user_icon
    @user = User.find_by(id:session[:user_id]) if session[:user_id]
  end
  
end
