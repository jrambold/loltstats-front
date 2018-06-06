class Team < ApplicationRecord
  has_many :users, dependent: :destroy

  after_create do |team|
    add_team(team)
  end

  before_destroy do |team|
    delete_team(team)
  end

  def self.backend_teams
    backend = Backend.new
    teams = backend.get_teams
  end

  def update_matches
    backend = Backend.new
    backend.update_team_flex_matches(self)
  end

  def best_by_position(min=6)
    backend = Backend.new
    backend.best_by_position(self, min)
  end

  private
    def add_team(team)
      backend = Backend.new
      backend.add_team(team)
    end

    def delete_team(team)
      backend = Backend.new
      backend.delete_team(team)
    end


end
