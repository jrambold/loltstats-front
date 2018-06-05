class TeamsController < ApplicationController
  def index
    @teams = Team.backend_teams
  end

  def show
    @team = Team.find(params[:id])
    @players = @team.backend_players
    @best = @team.best_by_position(6)
  end
end
