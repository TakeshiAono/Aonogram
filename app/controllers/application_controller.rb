class ApplicationController < ActionController::Base
  def user_aicon
    @user = User.find_by(id:session[:user_id]) if session[:user_id]
  end
  before_action :user_aicon
  
end
