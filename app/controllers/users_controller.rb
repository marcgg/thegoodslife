class UsersController < ApplicationController

  def dashboard
  end

  def show
    @user = User.find params[:id]
  end

  def update
    current_user.update_attributes params[:user]
    redirect_to account_path
  end

  def edit_current
    @user = current_user
  end

end
