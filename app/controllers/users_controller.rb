class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if Team.exists?(name: params[:team])
      team = Team.find_by(name: params[:team])
    else
      team = Team.create(name: params[:team])
    end

    user = current_user.users.new(team: team, leaguename: params[:name])

    if user.save
      redirect_to google_user_path(current_user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    if current_user && @user.google_user == current_user
      if params.key?(:commit) && params[:commit] == 'update'
        @user.update
      end
      up = UserPresenter.new(@user.solo_stats, @user.flex_stats)
      @solo_stats = up.solo_lanes
      @flex_stats = up.flex_lanes
    else
      redirect_to root_path
    end
  end
end
