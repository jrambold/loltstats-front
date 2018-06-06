class TeamsController < ApplicationController
  def index
    @teams = Team.all()
  end

  def show
    @team = Team.find(params[:id])
    @thing = @team.best_by_position
    @best = TeamPresenter.new(@team.best_by_position).lanes
  end
end
