class TeamsController < ApplicationController
  def index
    @teams = Team.all()
  end

  def show
    @team = Team.find(params[:id])
    @best = TeamPresenter.new(@team.best_by_position)
  end
end
