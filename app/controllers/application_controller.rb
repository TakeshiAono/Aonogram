class ApplicationController < ActionController::Base
  before_action :user_aicon
  
  def user_aicon
    @user = User.find_by(id:session[:user_id]) if session[:user_id]
  end
  
end
