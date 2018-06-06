class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    up = UserPresenter.new(@user.solo_stats, @user.flex_stats)
    @solo_stats = up.solo_lanes
    @flex_stats = up.flex_lanes
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
