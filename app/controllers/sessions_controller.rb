class SessionsController < ApplicationController
  def new
  end

  def create
    guser = GoogleUser.update_or_create(request.env['omniauth.auth'])
    session[:id] = guser.id
    redirect_to root_path
  end

  def destroy
    session.clear
    flash[:notice] = 'You have logged out'
    redirect_to root_path
  end
end
