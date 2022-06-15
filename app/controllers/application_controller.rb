class ApplicationController < ActionController::Base
  def user_aicon
    @user = User.find(session[:user_id]) if session[:user_id]
  end
  before_action :user_aicon
  
end
