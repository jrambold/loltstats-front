class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    begin
      team = Team.find(params[:team])
    rescue ActiveRecord::RecordNotFound => invalid
      team = Team.create(name: params[:team])
    end

    user = current_user.users.new(team: team, leaguename: params[:name])

    if user.save
      session[:user_id] = user.id
      redirect_to google_user_path(currentUser)
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
end
