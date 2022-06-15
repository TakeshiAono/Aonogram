class LoginController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.find_by(email: login_params[:email])
    if @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      if @user[:image]
        redirect_to pictures_path
      else
        redirect_to new_user_path
      end
    else
      redirect_to new_login_path
    end
  end

  private
  def login_params
    params.require(:user).permit(:email, :password)
  end
end
