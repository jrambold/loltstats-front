class Team < ApplicationRecord
  has_many :user_teams
  has_many :users, through: :user_teams

  def self.backend_teams
    bs = BackendService.new()
    teams = bs.get_teams
    teams = teams.map { |team| team[:fields][:name]  }
  end

  def backend_players
    bs = BackendService.new()
    players = bs.get_team_players(team)
    players = players.map { |player| player[:fields][:name] }
  end

  def best_by_position(min)
    bs = BackendService.new()
    players = bs.best_by_position(team, min)
  end
end
