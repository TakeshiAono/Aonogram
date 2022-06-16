class AccountsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    User.create(account_params)
    redirect_to new_login_path
  end
  
  def account_params
    params.require(:user).permit(:name, :email, :password, :password_digest)
  end
end
