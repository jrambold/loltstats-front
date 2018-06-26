class TeamsController < ApplicationController
  def index
    @teams = Team.all()
  end

  def show
    @team = Team.find(params[:id])
    if current_user && @team.google_users.exists?(current_user.id)
      if params.key?(:min)
        @min_games = params[:min].to_i
      else
        @min_games = 6
      end
      if params.key?(:commit) && params[:commit] == 'update'
        @team.update_matches
      end
      if params.key?(:commit) && params[:commit] == 'custom'
        @custom = @team.custom_team(params[:top], params[:mid], params[:jun], params[:adc], params[:sup])
      end
      if params.key?(:commit) && params[:commit] == 'together'
        @together = @team.together(params[:p1], params[:p2], params[:p3], params[:p4], params[:p5])
      end
      @best = TeamPresenter.new(@team.best_by_position(@min_games)).lanes
    else
      redirect_to root_path
    end
  end
end
