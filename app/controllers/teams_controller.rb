class TeamsController < ApplicationController
  def index
    @teams = Team.all()
  end

  def show
    @team = Team.find(params[:id])
    if params.key?(:min)
      @min_games = params[:min].to_i
    else
      @min_games = 6
    end
    if params.key?(:commit) && params[:commit] == 'update'
      @team.update_matches
    end
    @best = TeamPresenter.new(@team.best_by_position(@min_games)).lanes
  end
end
