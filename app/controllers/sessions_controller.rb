class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_facebook params[:user]
    session[:user_id] = user.id
    render status: :created, nothing: true
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def fake_login
    session[:user_id] = User.first
  end
end
